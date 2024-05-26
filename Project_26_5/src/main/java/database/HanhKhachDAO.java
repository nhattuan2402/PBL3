package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;

import model.HanhKhach;

public class HanhKhachDAO {
	public void themHanhKhach(HanhKhach hk) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO hanhkhach VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?)";
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
			st.setInt(10, hk.getKhoiLuongHanhLy());
			st.setString(11, hk.getMaHoaDon());
			st.setString(12, hk.getMaGheDi());
			st.setString(13, hk.getMaGheVe());
			st.executeUpdate();
			
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static ArrayList<HanhKhach> selectByMaHoaDon(String maHoaDon) {
		ArrayList<HanhKhach> result = new ArrayList<HanhKhach>();
		try {
			Connection con = JDBCUtil.getConnection();
			String query = "select * from hanhkhach where id_hoadon = ?";
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, maHoaDon);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String maGheDi = rs.getString("maGheDi");
				String maGheVe = rs.getString("maGheVe");
				HanhKhach hk = new HanhKhach();
				hk.setMaGheDi(maGheDi);
				hk.setMaGheVe(maGheVe);
				result.add(hk);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public static void main(String[] args) {
		
	}
	
}
