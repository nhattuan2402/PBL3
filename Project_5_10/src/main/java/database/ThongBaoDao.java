package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import model.ThongBao;

public class ThongBaoDao {
	public void themThongBao(ThongBao tb) {
		try {
			Connection con =JDBCUtil.getConnection();
			String sql = "INSERT INTO thongbao VALUES (?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, tb.getMaThongBao());
			st.setString(2, tb.getTenThongBao());
			st.setDate(3, tb.getThoiGian());
			st.setString(4, tb.getNoiDung());
			st.executeUpdate();
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}
	
	public void xemTatCaThongBao() {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM thongbao";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int soCot = rsmd.getColumnCount();
			while(rs.next()) {
				for(int i=1;i<=soCot;i++) {
					System.out.print(rs.getObject(i)+" ");
				}
				System.out.println("\n");
			}
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}
}
