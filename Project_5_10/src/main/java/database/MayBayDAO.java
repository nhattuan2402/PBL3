package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

import model.MayBay;

public class MayBayDAO implements DAOInterface<MayBay> {
	
	
	//xem tất cả máy bay
	@Override
	public ArrayList<MayBay> selectAll() {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM maybay";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			
			ResultSetMetaData rsmd = rs.getMetaData();
			int soCot = rsmd.getColumnCount();
			while(rs.next()) {
				for(int i=1;i<=soCot;i++) {
					System.out.print(rs.getObject(i)+"\t");
				}
				System.out.println("\n");
			}
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return null;
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
			st.setInt(3, mb.getSoHangGheThuongGia());
			st.setInt(4, mb.getSoHangGhePhoThong());
			st.setInt(5, mb.getSoGheHangThuongGia());
			st.setInt(6, mb.getSoGheHangPhoThong());
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
			st.setInt(1, mb.getSoHangGheThuongGia());
			st.setInt(2, mb.getSoHangGhePhoThong());
			st.setInt(3, mb.getSoGheHangThuongGia());
			st.setInt(4, mb.getSoGheHangPhoThong());
			st.setString(5, mb.getMaMayBay());
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
				int soHangGheThuongGia = rs.getInt("sohangghethuonggia");
				int soHangGhePhoThong = rs.getInt("sohangghephothong");
				int soGheHangThuongGia = rs.getInt("soghehangthuonggia");
				int soGheHangPhoThong = rs.getInt("soghehangphothong");
				mayBay = new MayBay(maMayBay, loaiMayBay, soHangGheThuongGia, soHangGhePhoThong, soGheHangThuongGia, soGheHangPhoThong);
				break;
			}
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return mayBay;
	}

	@Override
	public MayBay selectByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}
}
