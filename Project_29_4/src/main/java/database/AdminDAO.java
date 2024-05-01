package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;


public class AdminDAO  {

	public static void xemTatCaTaiKhoan() {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = " SELECT id_taikhoan, tendangnhap, vaitro FROM taikhoan";
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
			e.printStackTrace();
		}
	}
	
	public static void xemTaiKhoanNhanVien() {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = " SELECT id_taikhoan, tendangnhap FROM taikhoan WHERE id_taikhoan LIKE '%TKNV%' ";
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
			e.printStackTrace();
		}
	}
	
	public static void xemTaiKhoanKhachHang() {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = " SELECT id_taikhoan, tendangnhap FROM taikhoan WHERE id_taikhoan LIKE '%TKKH%' ";
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
			e.printStackTrace();
		}
	}
	

	public static void main(String[] args) {
		xemTatCaTaiKhoan();
	}
}
