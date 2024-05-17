package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

import model.HoTro;

public class HoTroDAO implements DAOInterface<HoTro>{

	@Override
	public ArrayList<HoTro> selectAll() {
		ArrayList<HoTro> result = new ArrayList<HoTro>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM yeucauhotro";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			System.out.println("\n");
			int soCot = rsmd.getColumnCount();
			while(rs.next()) {
				String maHoTro = rs.getString("id_hotro");
				String tieuDe = rs.getString("tieude");
				String email = rs.getString("email");
				Date thoiGian = rs.getDate("thoigian");
				String mota = rs.getString("noidung");
				boolean trangThai = rs.getBoolean("trangthaixuly");
				HoTro ht = new HoTro(maHoTro, tieuDe, email, thoiGian, mota, trangThai);
				result.add(ht);
			}
			rs.close();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public HoTro selectByID(HoTro t) {
		HoTro hoTro = new HoTro();
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void Add(HoTro t) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO yeucauhotro VALUES(?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaHoTro());
			st.setString(2, t.getTieuDe());
			st.setString(3, t.getEmail());
			st.setDate(4, t.getThoiGian());
			st.setString(5, t.getMoTa());
			st.setBoolean(6, t.isTrangThai());
			st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void Update(HoTro t) {
		System.out.println("Update Hotro");
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE yeucauhotro SET tieude=?, email=?, thoigian=?, noidung=?, trangthaixuly=? WHERE id_hotro=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getTieuDe());
			st.setString(2, t.getEmail());
			st.setDate(3, t.getThoiGian());
			st.setString(4, t.getMoTa());
			st.setBoolean(5, t.isTrangThai());
			st.setString(6, t.getMaHoTro());
			
			st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void Delete(HoTro t) {
		try {
            Connection con = JDBCUtil.getConnection();
            String sql = "UPDATE yeucauhotro SET tieude=?, email=?, thoigian=?, noidung=?, trangthaixuly=? WHERE id_hotro=?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, t.getTieuDe());
            st.setString(2, t.getEmail());
            st.setDate(3, t.getThoiGian());
            st.setString(4, t.getMoTa());
            st.setBoolean(5, t.isTrangThai());
            st.setString(6, t.getMaHoTro());
            st.executeUpdate();
            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	@Override
	public HoTro selectByID(String id) {
		HoTro hoTro = null;
	    try {
	        Connection con = JDBCUtil.getConnection();
	        String sql = "SELECT * FROM yeucauhotro WHERE id_hotro=?";
	        PreparedStatement st = con.prepareStatement(sql);
	        st.setString(1, id);
	        ResultSet rs = st.executeQuery();
	        if (rs.next()) {
	            String maHoTro = rs.getString("id_hotro");
	            String tieuDe = rs.getString("tieude");
	            String email = rs.getString("email");
	            Date thoiGian = rs.getDate("thoigian");
	            String mota = rs.getString("noidung");
	            boolean trangThai = rs.getBoolean("trangthaixuly");
	            hoTro = new HoTro(maHoTro, tieuDe, email, thoiGian, mota, trangThai);
	        }
	        rs.close();
	        JDBCUtil.closeConnection(con);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return hoTro;

	}

	public ArrayList<HoTro> timKiemHoTro(String email, String thoiGian, String trangThai) {
		ArrayList<HoTro> result = new ArrayList<HoTro>();
		
		try {
			Connection con = JDBCUtil.getConnection();
	        String sql = "SELECT * FROM yeucauhotro WHERE ";
	        PreparedStatement st = null;
	        
	        // Xử lý các trường hợp của trạng thái xử lý
	        if (trangThai.equals("DaXuLy")) {
	            sql += "trangthaixuly = 1";
	        } else if (trangThai.equals("ChuaXuLy")) {
	            sql += "trangthaixuly = 0";
			} else {
				sql += "1=1";
			}
	        
	        // Xử lý các trường hợp của email và thời gian
	        if (!email.isEmpty()) {
	            sql += " AND email LIKE ?";
	        }
	        if (!thoiGian.isEmpty()) {
	            sql += " AND thoigian = ?";
	        }
	        
	        st = con.prepareStatement(sql);
	        
	        // Thiết lập các tham số cho email và thời gian nếu chúng không rỗng
	        int paramIndex = 1;
	        if (!email.isEmpty()) {
	            st.setString(paramIndex++, "%" +  email + "%");
	        }
	        if (!thoiGian.isEmpty()) {
	            st.setString(paramIndex++, thoiGian);
	        }
	        
	        System.out.println("SQL: " + st.toString());
	        
	        ResultSet rs = st.executeQuery();
	        
	        while (rs.next()) {
	            String maHoTro = rs.getString("id_hotro");
	            String tieuDe = rs.getString("tieude");
	            String hoTroEmail = rs.getString("email");
	            Date hoTroThoiGian = rs.getDate("thoigian");
	            String mota = rs.getString("noidung");
	            boolean hoTroTrangThai = rs.getBoolean("trangthaixuly");
	            
	            HoTro ht = new HoTro(maHoTro, tieuDe, hoTroEmail, hoTroThoiGian, mota, hoTroTrangThai);
	            result.add(ht);
	        }
	        
	        rs.close();
	        JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
