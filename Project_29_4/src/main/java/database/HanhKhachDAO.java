package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;

import model.HanhKhach;

public class HanhKhachDAO {
	public static void themHanhKhach(HanhKhach hk) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO hanhkhach VALUES (?,?,?,?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, hk.getMaHanhKhach());
			st.setString(2, hk.getHoVaTen());
			st.setDate(3, hk.getNgaySinh());
			st.setString(4, hk.getEmail());
			st.setString(5, hk.getSoDienThoai());
			st.setString(6, hk.getDiaChi());
			st.setString(7, hk.getSoCCCD());
			st.setString(8, hk.getQuocTich());
			st.setBoolean(9, hk.isGioiTinh());
			
			st.executeUpdate();
			
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		HanhKhachDAO hkd = new HanhKhachDAO();
		
	}
	
}
