package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Time;
import java.util.ArrayList;

import model.ChuyenBay;
import model.TuyenBay;

public class TuyenBayDAO implements DAOInterface<TuyenBay>{
	
	
	// xem tất cả tuyến bay
	@Override
	public ArrayList<TuyenBay> selectAll() {
		ArrayList<TuyenBay> result = new ArrayList<TuyenBay>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM tuyenbay";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
					String maChuyenBay = rs.getString("id_tuyenbay");
					String diemDi = rs.getString("diemdi");
					String diemDen = rs.getString("diemden");
					double thoiGianBay = rs.getDouble("thoigianbay");
					TuyenBay tb = new TuyenBay(maChuyenBay, diemDi, diemDen, thoiGianBay);
					result.add(tb);
			}
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

	// thêm 1 tuyến bay
	@Override
	public void Add(TuyenBay tb) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO tuyenbay VALUES(?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,tb.getMaTuyenBay());
			st.setString(2, tb.getNoiCatCanh());
			st.setString(3, tb.getNoiHaCanh());
			st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			System.err.println(e.toString());
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
		TuyenBay tb = new TuyenBay();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM tuyenbay where id_tuyenbay = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				tb.setThoiGianBay(rs.getInt("thoigianbay"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return tb;
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
	
}
