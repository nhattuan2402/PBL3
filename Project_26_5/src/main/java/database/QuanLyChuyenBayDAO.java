package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.ChuyenBay;
import model.QuanLyChuyenBay;

public class QuanLyChuyenBayDAO  {
	public static ArrayList<String> getMaCB(String maKhachHang) {
		ArrayList<String> maCB = new ArrayList<String>();
		try {
			Connection con = JDBCUtil.getConnection();
			String query = "select * from quanlychuyenbay where id_khachhang = ?";
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, maKhachHang);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String mcb = rs.getString("machuyenbay");
				maCB.add(mcb);
			}
			
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return maCB;
	}
	
	public static ArrayList<QuanLyChuyenBay> selectBeforeDate (String maKhachHang) {
		ArrayList<QuanLyChuyenBay> allDaDi = new ArrayList<QuanLyChuyenBay>();
		ArrayList<ChuyenBay> result = new ArrayList<ChuyenBay>();
		ArrayList<ChuyenBay> allCBDaDi = new ArrayList<ChuyenBay>();
		try {
			Connection con = JDBCUtil.getConnection();
			ArrayList<String> maCB = getMaCB(maKhachHang);
			for(String s : maCB) {
				ChuyenBay cb = new ChuyenBayDAO().selectByID(s);
				if(!result.contains(cb)) {
					result.add(cb);
				}
			}
			allCBDaDi = ChuyenBayDAO.selectByBeforeDate(result);
			for(ChuyenBay cb : allCBDaDi) {
				String query = "select * from quanlychuyenbay where machuyenbay = ?";
				PreparedStatement st = con.prepareStatement(query);
				st.setString(1, cb.getMaChuyenBay());
				ResultSet rs = st.executeQuery();
				while(rs.next()) {
					String maquanlychuyenbay = rs.getString("id_quanlychuyenbay");
					int soHanhKhach = rs.getInt("sohanhkhach");
					QuanLyChuyenBay qlcb = new QuanLyChuyenBay(maquanlychuyenbay, maKhachHang, cb, soHanhKhach);
					allDaDi.add(qlcb);
				}
			}
			for(QuanLyChuyenBay q : allDaDi) {
				System.out.println(q.toString());
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return allDaDi;
	}
	
	public static ArrayList<QuanLyChuyenBay> selectAfterDate (String maKhachHang) {
		ArrayList<QuanLyChuyenBay> allSapToi = new ArrayList<QuanLyChuyenBay>();
		ArrayList<ChuyenBay> result = new ArrayList<ChuyenBay>();
		ArrayList<ChuyenBay> allCBSapToi = new ArrayList<ChuyenBay>();
		try {
			Connection con = JDBCUtil.getConnection();
			ArrayList<String> maCB = getMaCB(maKhachHang);
			for(String s : maCB) {
				ChuyenBay cb = new ChuyenBayDAO().selectByID(s);
				if(!result.contains(cb)) {
					result.add(cb);
				}
			}
			
			allCBSapToi = ChuyenBayDAO.selectByAfterDate(result);
			for(ChuyenBay cb : allCBSapToi) {
				String query = "select * from quanlychuyenbay where machuyenbay = ?";
				PreparedStatement st = con.prepareStatement(query);
				st.setString(1, cb.getMaChuyenBay());
				ResultSet rs = st.executeQuery();
				while(rs.next()) {
					String maquanlychuyenbay = rs.getString("id_quanlychuyenbay");
					int soHanhKhach = rs.getInt("sohanhkhach");
					QuanLyChuyenBay qlcb = new QuanLyChuyenBay(maquanlychuyenbay, maKhachHang, cb, soHanhKhach);
					allSapToi.add(qlcb);
				}
			}
			for(QuanLyChuyenBay q : allSapToi) {
				System.out.println(q.toString());
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return allSapToi;
	}
	
	public static void themQuanLyChuyenBay(QuanLyChuyenBay qlcb) {
		try {
			Connection con = JDBCUtil.getConnection();
			String query = "INSERT INTO quanlychuyenbay VALUES (?,?,?,?)";
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, qlcb.getMaQuanLy());
			st.setString(2, qlcb.getMaKhachHang());
			st.setString(3, qlcb.getChuyenBay().getMaChuyenBay());
			st.setInt(4, qlcb.getSoHanhKhach());
			st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		ArrayList<QuanLyChuyenBay> allSapToi = QuanLyChuyenBayDAO.selectAfterDate("KH3");
		for(QuanLyChuyenBay cb : allSapToi) {
			System.out.println(cb.toString());
		}
//		ArrayList<QuanLyChuyenBay> allSapToi = QuanLyChuyenBayDAO.selectAfterDate();
	}
}
