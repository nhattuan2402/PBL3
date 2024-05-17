package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Resultset;

import model.ChuyenBay;

public class ChuyenBayDAO implements DAOInterface<ChuyenBay> {
	
	

	@Override
	public ArrayList<ChuyenBay> selectAll() {
		ArrayList<ChuyenBay> result = new ArrayList<ChuyenBay>();
		
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM chuyenbay "
					+ "JOIN tuyenbay ON chuyenbay.id_tuyenbay = tuyenbay.id_tuyenbay "
					+ "JOIN lichbay ON chuyenbay.id_lichbay = lichbay.id_lichbay";
			
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			
			ResultSetMetaData rsmd = rs.getMetaData();
			System.out.println("\n");
			while(rs.next()) {
				
				String maChuyenBay = rs.getString("id_chuyenbay");
				String maMayBay = rs.getString("id_maybay");
				String diemDi = rs.getString("diemdi");
				String diemDen = rs.getString("diemden");
				String ngayBay = rs.getString("ngayBay");
				String gioBay = rs.getString("gioBay");
				int gia = rs.getInt("gia");
				
				ChuyenBay cb = new ChuyenBay(maChuyenBay, maMayBay, diemDi, diemDen, Date.valueOf(ngayBay),
						Time.valueOf(gioBay), gia);
				result.add(cb);
			}
			rs.close();
			JDBCUtil.closeConnection(con);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
 	}

	@Override
	public ChuyenBay selectByID(ChuyenBay t) {
		ChuyenBay result = null;
		
		return result;
	}

	@Override
	public void Add(ChuyenBay t) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO chuyenbay(id_chuyenbay, id_maybay, id_lichbay, id_tuyenbay, ngaybay, gia) VALUES(?, ?, ?, ?, ?, ?)";
			PreparedStatement st = con.prepareStatement(sql);
	        st.setString(1, t.getMaMayBay());
	        st.setString(2, t.getMaMayBay());
	        st.executeUpdate();
	        System.out.println("Thêm chuyến bay thành công");
	        JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void Update(ChuyenBay t) {
	    
	}

	@Override
	public void Delete(ChuyenBay t) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "DELETE FROM chuyenbay WHERE id_chuyenbay = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaChuyenBay());
			st.executeUpdate();
			System.out.println("Xoa thanh cong");
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	public static ArrayList<ChuyenBay> layQuaMaTuyenBay(String maTuyenBay) {
		ArrayList<ChuyenBay> chuyenBay = new ArrayList<ChuyenBay>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM chuyenbay JOIN tuyenbay ON chuyenbay.id_tuyenbay = tuyenbay.id_tuyenbay WHERE chuyenbay.id_tuyenbay = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,maTuyenBay);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String maChuyenBay = rs.getString("id_chuyenbay");
				String maMayBay = rs.getString("id_maybay");
				String diemDi = rs.getString("diemdi");
				String diemDen = rs.getString("diemden");
				String ngayBay = rs.getString("ngayBay");
				String gioBay = rs.getString("gioBay");
				int gia = rs.getInt("gia");
				
				ChuyenBay cb = new ChuyenBay(maChuyenBay, maMayBay, diemDi, diemDen, 
						Date.valueOf(ngayBay), Time.valueOf(gioBay), gia);
				chuyenBay.add(cb);	
			}
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return chuyenBay;
	}

	public static void main(String[] args) {
		ChuyenBayDAO cbd = new ChuyenBayDAO();
		cbd.selectAll();
	}

	public static ArrayList<ChuyenBay> layQuaMaTuyenBayVaNgayDi(String maTuyenBay, String ngayDi) {
		ArrayList<ChuyenBay> chuyenBay = new ArrayList<ChuyenBay>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM chuyenbay JOIN tuyenbay ON chuyenbay.id_tuyenbay = tuyenbay.id_tuyenbay JOIN lichbay "
					+ "ON chuyenbay.id_lichbay = lichbay.id_lichbay "
					+ "WHERE chuyenbay.id_tuyenbay = ? AND chuyenbay.ngaybay = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,maTuyenBay);
			st.setString(2, ngayDi);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String maChuyenBay = rs.getString("id_chuyenbay");
				String maMayBay = rs.getString("id_maybay");
				String diemDi = rs.getString("diemdi");
				String diemDen = rs.getString("diemden");
				String ngayBay = rs.getString("ngaybay");
				String gioBay = rs.getString("giobay");
				int gia = rs.getInt("gia");
				
				ChuyenBay cb = new ChuyenBay(maChuyenBay, maMayBay, diemDi, diemDen, 
						Date.valueOf(ngayBay), Time.valueOf(gioBay), gia);
				chuyenBay.add(cb);
				
			}
			
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return chuyenBay;
	}

	@Override
	public ChuyenBay selectByID(String id) {
		ChuyenBay result = null;
	    
	    try {
	        Connection con = JDBCUtil.getConnection();
	        String sql = "SELECT * FROM chuyenbay "
	                + "JOIN tuyenbay ON chuyenbay.id_tuyenbay = tuyenbay.id_tuyenbay "
	                + "JOIN lichbay ON chuyenbay.id_lichbay = lichbay.id_lichbay "
	                + "WHERE chuyenbay.id_chuyenbay  = ?";
	        PreparedStatement st = con.prepareStatement(sql);
	        st.setString(1, id);
	        ResultSet rs = st.executeQuery();
	        
	        while (rs.next()) {
	        	String maChuyenBay = rs.getString("id_chuyenbay");
				String maMayBay = rs.getString("id_maybay");
				String diemDi = rs.getString("diemdi");
				String diemDen = rs.getString("diemden");
				String ngayBay = rs.getString("ngaybay");
				String gioBay = rs.getString("giobay");
				int gia = rs.getInt("gia");
				
				result = new ChuyenBay(maChuyenBay, maMayBay, diemDi, diemDen, 
						Date.valueOf(ngayBay), Time.valueOf(gioBay), gia);
				break;
	        }
			if (result == null) {
				System.out.println("Khong tim thay chuyen bay");
			}
	        
	        rs.close();
	        JDBCUtil.closeConnection(con);
	    } catch(Exception e) {
	        e.printStackTrace();
	    }
	    
	    return result;
	}

	public ArrayList<ChuyenBay> timKiemChuyenBay(String maChuyenBay, String thoiGian) {
	    ArrayList<ChuyenBay> result = new ArrayList<ChuyenBay>();
	    try {
	        Connection con = JDBCUtil.getConnection();
	        String sql ="";
	        PreparedStatement st = null;
	        
	        if (maChuyenBay.equals("") && !thoiGian.equals("")) {
	            sql = "SELECT * FROM chuyenbay "
	            		+ "JOIN tuyenbay ON chuyenbay.id_tuyenbay = tuyenbay.id_tuyenbay "
	 	                + "JOIN lichbay ON chuyenbay.id_lichbay = lichbay.id_lichbay "
	            		+ "WHERE ngaybay = ?";
	            st = con.prepareStatement(sql);
	            st.setString(1, thoiGian);
	            
	        } else if (!maChuyenBay.equals("") && thoiGian.equals("")) {
	            sql = "SELECT * FROM chuyenbay "
	            		+ "JOIN tuyenbay ON chuyenbay.id_tuyenbay = tuyenbay.id_tuyenbay "
	 	                + "JOIN lichbay ON chuyenbay.id_lichbay = lichbay.id_lichbay "
	            		+ "WHERE id_chuyenbay LIKE ?";
	            st = con.prepareStatement(sql);
	            st.setString(1, "%" + maChuyenBay + "%");
	        } else if (!maChuyenBay.equals("") && !thoiGian.equals("")) {
	            sql = "SELECT * FROM chuyenbay "
	            		+ "JOIN tuyenbay ON chuyenbay.id_tuyenbay = tuyenbay.id_tuyenbay "
	 	                + "JOIN lichbay ON chuyenbay.id_lichbay = lichbay.id_lichbay "
	            		+ "WHERE ngaybay = ? AND id_chuyenbay LIKE ?";
	            st = con.prepareStatement(sql);
	            st.setString(1, thoiGian);
	            st.setString(2, "%" + maChuyenBay + "%");
	        }
	        
	        ResultSet rs = st.executeQuery();
	        while (rs.next()) {
	            String maChuyenBay1 = rs.getString("id_chuyenbay");
	            String maMayBay = rs.getString("id_maybay");
	            String diemDi = rs.getString("diemdi");
	            String diemDen = rs.getString("diemden");
	            String ngayBay = rs.getString("ngaybay");
	            String gioBay = rs.getString("giobay");
	            int gia = rs.getInt("gia");

	            ChuyenBay cb = new ChuyenBay(maChuyenBay1, maMayBay, diemDi, diemDen, Date.valueOf(ngayBay),
	                    Time.valueOf(gioBay), gia);
	            result.add(cb);
	        }
	        rs.close();
	        JDBCUtil.closeConnection(con);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return result;
	}
	
	public String getMaxMaChuyenBay() {
        String maxMaChuyenBay = null;
        try {
        	Connection con = JDBCUtil.getConnection();
            String query = "SELECT MAX(id_chuyenbay) FROM chuyenbay";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                maxMaChuyenBay = rs.getString(1);
            }
            rs.close();
            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return maxMaChuyenBay;
    }

}
