package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

import model.TuyenBay;

public class TuyenBayDAO implements DAOInterface<TuyenBay>{
	
	
	// xem tất cả tuyến bay
	@Override
	public ArrayList<TuyenBay> selectAll() {
		ArrayList<TuyenBay> result = new ArrayList<TuyenBay>();
		System.out.println("Danh sách tuyến bay");
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM tuyenbay";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			ResultSetMetaData rsmd  = rs.getMetaData();
			int soCot = rsmd.getColumnCount();
			while(rs.next()) {
				for(int i=1;i<=soCot;i++) {
					System.out.print(rs.getObject(i)+"\t");
				}
				System.out.println();
				
				String id_tuyenbay = rs.getString("id_tuyenbay");
				String diemdi = rs.getString("diemdi");
				String diemden = rs.getString("diemden");
				double thoigianbay = rs.getDouble("thoigianbay");
				
				TuyenBay tb = new TuyenBay(id_tuyenbay, diemdi, diemden, thoigianbay);
				result.add(tb);
			}
            rs.close();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return result;
	}
	
	
	// xem tuyến bay theo id
	@Override
	public TuyenBay selectByID(TuyenBay tb) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM tuyenbay where id_tuyenbay = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, tb.getMaTuyenBay());
			ResultSet rs = st.executeQuery();
			ResultSetMetaData rsmd  = rs.getMetaData();
			int soCot = rsmd.getColumnCount();
			while(rs.next()) {
				for(int i=1;i<=soCot;i++) {
					System.out.print(rs.getObject(i)+"\t");
				}
				System.out.println();
			}
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return null;
	}
	// Kiểm tra xem có tuyến bay nào đã tồn tại giữa điểm đi và điểm đến chưa
    public boolean kiemTraTonTai(String diemDi, String diemDen) {
        boolean tonTai = false;
        try {
            Connection con = JDBCUtil.getConnection();
            String sql = "SELECT COUNT(*) FROM tuyenbay WHERE diemdi = ? AND diemden = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, diemDi);
            st.setString(2, diemDen);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                if (count > 0) {
                    tonTai = true; // Đã tồn tại tuyến bay giữa điểm đi và điểm đến
                }
            }
            rs.close();
            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            System.err.println(e.toString());
        }
        return tonTai;
    }

	// thêm 1 tuyến bay
	@Override
	public void Add(TuyenBay tb) {
		if (!kiemTraTonTai(tb.getNoiCatCanh(), tb.getNoiHaCanh())) {
            try {
                Connection con = JDBCUtil.getConnection();
                String sql = "INSERT INTO tuyenbay VALUES(?,?,?,?)";
                PreparedStatement st = con.prepareStatement(sql);
                st.setString(1, tb.getMaTuyenBay());
                st.setString(2, tb.getNoiCatCanh());
                st.setString(3, tb.getNoiHaCanh());
                st.setDouble(4, tb.getThoiGianBay());
                st.executeUpdate();
                JDBCUtil.closeConnection(con);
            } catch (Exception e) {
                System.err.println(e.toString());
            }
        } else {
            System.out.println("Đã tồn tại tuyến bay giữa " + tb.getNoiCatCanh() + " và " + tb.getNoiHaCanh());
        }
	}

	@Override
	public void Update(TuyenBay tb) {
	}

	// xóa 1 tuyến bay
	@Override
	public void Delete(TuyenBay tb) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "DELETE FROM tuyenbay WHERE id_tuyenbay = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, tb.getMaTuyenBay());
			st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}
	
	// lấy id tuyến bay thông qua điểm đi và điểm dến 
	public static TuyenBay layQuaDiemDiVaDen(String diemDi, String diemDen) {
		TuyenBay tuyenBay = null;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM tuyenbay WHERE diemdi = ? AND diemden = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, diemDi);
			st.setString(2, diemDen);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String id_tuyenbay = rs.getString("id_tuyenbay");
				
				double thoiGianBay = rs.getDouble("thoigianbay");
				tuyenBay = new TuyenBay(id_tuyenbay, diemDi, diemDen, thoiGianBay);
			}
			
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		
		return tuyenBay;
		
	}


	public static ArrayList<String> layThanhPho() {
		ArrayList<String> thanhPho = new ArrayList<String>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT diemdi FROM tuyenbay";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String tp = rs.getString("diemdi");
				if(!thanhPho.contains(tp)) {
					thanhPho.add(tp);
				}
			}
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return thanhPho;
	}


	@Override
	public TuyenBay selectByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}


	public String getMaxMaTuyenBay() {
		String maxMaTuyenBay = "";
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT MAX(id_tuyenbay) FROM tuyenbay";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				maxMaTuyenBay = rs.getString(1);
			}
			rs.close();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return maxMaTuyenBay;
	}


	public ArrayList<TuyenBay> timKiemTuyenBay(String chuyenDi, String chuyenVe) {
		ArrayList<TuyenBay> result = new ArrayList<TuyenBay>();
		try {
			Connection con = JDBCUtil.getConnection();
			
			String sql = "SELECT * FROM tuyenbay WHERE 1=1 ";
			PreparedStatement st = null;
			
			if (!chuyenDi.isEmpty()) {
				sql += "AND diemdi LIKE ?";
			} 
			if (!chuyenVe.isEmpty()) {
				sql += "AND diemden LIKE ?";
			}
			System.out.println("sql: " + sql);
			int paramIndex = 1;
			st = con.prepareStatement(sql);
			if (!chuyenDi.isEmpty()) {
				st.setString(paramIndex++, "%" + chuyenDi + "%");
			}
			if (!chuyenVe.isEmpty()) {
				st.setString(paramIndex++, "%" + chuyenVe + "%");
			} 
			ResultSet rs = st.executeQuery();
			while (rs.next()) {
				String id_tuyenbay = rs.getString("id_tuyenbay");
				String diemdi = rs.getString("diemdi");
				String diemden = rs.getString("diemden");
				double thoigianbay = rs.getDouble("thoigianbay");

				TuyenBay tb = new TuyenBay(id_tuyenbay, diemdi, diemden, thoigianbay);
				result.add(tb);
			}
			rs.close();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
