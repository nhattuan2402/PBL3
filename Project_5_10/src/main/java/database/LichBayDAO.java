package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Time;
import java.util.ArrayList;

import model.LichBay;

public class LichBayDAO implements DAOInterface<LichBay>{

	// xem tat ca lich bay
	@Override
	public ArrayList<LichBay> selectAll() {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM lichbay";
			PreparedStatement st = con.prepareStatement(sql);
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
			e.printStackTrace();
		}
		return null;
	}

	// xem lich bay theo id
	@Override
	public LichBay selectByID(LichBay lb) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM lichbay WHERE id_lichbay = ? ";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,lb.getMaLichBay());
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
			e.printStackTrace();
		}
		return null;
	}

	
	// them mot lich bay
	@Override
	public void Add(LichBay lb) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO lichbay VALUES(?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,lb.getMaLichBay());
			st.setTime(2, lb.getThoiGianCatCanh());
			st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void Update(LichBay lb) {
		// TODO Auto-generated method stub
		
	}

	// xoa 1 lich bay
	@Override
	public void Delete(LichBay lb) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "DELETE FROM lichbay WHERE id_lichbay = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, lb.getMaLichBay());
			st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}
	
	
	// lấy id lịch bay thông qua thời gian cất cánh
	public static LichBay layQuaThoiGian(String thoiGian) {
		LichBay lichBay = null;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM lichbay WHERE thoigiancatcanh = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, thoiGian);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String maLichBay = rs.getString("id_lichbay");
				Time thoiGianCatCanh = rs.getTime("thoigiancatcanh");
				lichBay = new LichBay(maLichBay, thoiGianCatCanh);
				break;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return lichBay;
	}

	@Override
	public LichBay selectByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
