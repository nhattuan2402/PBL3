package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

import model.MayBay;
import model.TuyenBay;

public class MayBayDAO implements DAOInterface<MayBay> {
	
	
	//xem tất cả máy bay
	@Override
	public ArrayList<MayBay> selectAll() {
		ArrayList<MayBay> result = new ArrayList<MayBay>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM maybay";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String maMayBay = rs.getString("id_maybay");
				String loaiMayBay = rs.getString("loaimaybay");
				int soGheThuongGia = rs.getInt("soghethuonggia");
				int soCotThuongGia = rs.getInt("socotthuonggia");
				int soGhePhoThong1 = rs.getInt("soghephothong1");
				int soGhePhoThong2 = rs.getInt("soghephothong2");
				int soGhePhoThong3 = rs.getInt("soghephothong3");
				int soCotPhoThong = rs.getInt("socotphothong");
				
				
				MayBay mb = new MayBay(maMayBay, loaiMayBay, soGheThuongGia, soCotThuongGia, soGhePhoThong1, soGhePhoThong2, soGhePhoThong3, soCotPhoThong);
				result.add(mb);
			}
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return result;
	}

	// xem máy bay theo ID
	@Override
	public MayBay selectByID(MayBay mb) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM maybay where id_maybay = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, mb.getMaMayBay());
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

	// thêm 1 máy bay
	@Override
	public void Add(MayBay mb) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO maybay VALUES (?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, mb.getMaMayBay());
			st.setString(2, mb.getLoaiMayBay());
			st.setInt(3, mb.getSoGheThuongGia());
			st.setInt(4, mb.getSoCotThuongGia());
			st.setInt(5, mb.getSoGhePhoThong1());
			st.setInt(6, mb.getSoGhePhoThong2());
			st.setInt(7, mb.getSoGhePhoThong3());
			st.setInt(8, mb.getSoCotPhoThong());
			st.executeUpdate();
			
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}

	// update theo id
	@Override
	public void Update(MayBay mb) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE maybay SET sohangghethuonggia = ?, sohangghephothong = ?, soghehangthuonggia = ?, soghehangphothong =? WHERE id_maybay = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setInt(1, mb.getSoGheThuongGia());
			st.setInt(2, mb.getSoCotThuongGia());
			st.setInt(3, mb.getSoGhePhoThong1());
			st.setInt(4, mb.getSoGhePhoThong2());
			st.setInt(5, mb.getSoGhePhoThong3());
			st.setInt(6, mb.getSoCotPhoThong());
			st.setString(7, mb.getMaMayBay());
			st.executeUpdate();
			
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}

	// xóa 1 máy bay
	@Override
	public void Delete(MayBay mb) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "DELETE FROM tuyenbay WHERE id_maybay = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, mb.getMaMayBay());
			st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}

	public static MayBay layQuaTenMayBay(String loaiMayBay) {
		MayBay mayBay = null;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM maybay WHERE tenMayBay = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, loaiMayBay);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String maMayBay = rs.getString("id_maybay");
				int soGheThuongGia = rs.getInt("soghethuonggia");
				int soCotThuongGia = rs.getInt("socotthuonggia");
				int soGhePhoThong1 = rs.getInt("soghephothong1");
				int soGhePhoThong2 = rs.getInt("soghephothong2");
				int soGhePhoThong3 = rs.getInt("soghephothong3");
				int soCotPhoThong = rs.getInt("socotphothong");
				
				
				mayBay = new MayBay(maMayBay, loaiMayBay, soGheThuongGia, soCotThuongGia, soGhePhoThong1, soGhePhoThong2, soGhePhoThong3, soCotPhoThong);
				break;
			}
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return mayBay;
	}

	@Override
	public MayBay selectByID(String id) {
		MayBay mayBay = null;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM maybay WHERE id_maybay = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, id);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String loaiMayBay = rs.getString("loaimaybay");
				int soGheThuongGia = rs.getInt("soghethuonggia");
				int soCotThuongGia = rs.getInt("socotthuonggia");
				int soGhePhoThong1 = rs.getInt("soghephothong1");
				int soGhePhoThong2 = rs.getInt("soghephothong2");
				int soGhePhoThong3 = rs.getInt("soghephothong3");
				int soCotPhoThong = rs.getInt("socotphothong");
				
				
				mayBay = new MayBay(id, loaiMayBay, soGheThuongGia, soCotThuongGia, soGhePhoThong1, soGhePhoThong2, soGhePhoThong3, soCotPhoThong);
				break;
			}
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return mayBay;
	}
}
