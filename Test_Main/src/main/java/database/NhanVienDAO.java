package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import model.NhanVien;
import model.TaiKhoan;


public class NhanVienDAO {
	
	//xem chi tiết một nhân viên
	public static void xemChiTietMotNhanVien(TaiKhoan tk) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM nhanvien WHERE  id_taikhoan = ? ";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, tk.getMaTaiKhoan());
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
	
	// cập nhật thông tin nhân viên
		public static void capNhatThongTin(NhanVien nv) {
			try {
				Connection con = JDBCUtil.getConnection();
				String sql = "UPDATE nhanvien SET  email = ?, sodienthoai = ?, diachi = ? WHERE id_nhanvien = ?";
				PreparedStatement st = con.prepareStatement(sql);
				st.setString(1, nv.getEmail());
				st.setString(2, nv.getSoDienThoai());
				st.setString(3, nv.getDiaChi());
				st.setString(4, nv.getMaNhanVien());
				
				int ok = st.executeUpdate();
				System.out.println(ok);
				JDBCUtil.closeConnection(con);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		// thêm nhân viên
		public static void themNhanVien(NhanVien nv, TaiKhoan tk) {
			try {
				Connection con = JDBCUtil.getConnection();
				String sql1 = "INSERT INTO nhanvien VALUES(?,?,?,?,?,?,?,?)";
				PreparedStatement st = con.prepareStatement(sql1);
				st.setString(1,nv.getMaNhanVien());
				st.setString(2,nv.getMaTaiKhoan());
				st.setString(3,nv.getHoVaTen());
				st.setDate(4,nv.getNgaySinh());
				st.setString(5,nv.getEmail());
				st.setString(6,nv.getSoDienThoai());
				st.setString(7,nv.getDiaChi());
				st.setBoolean(8,nv.isGioiTinh());
				st.executeUpdate();
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		public static void main(String[] args) {
			
		}

		public NhanVien selectByMaTaiKhoan(String maTaiKhoan) {
			// TODO Auto-generated method stub
			return null;
		}
}
