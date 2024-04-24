package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;

import javax.sound.midi.SysexMessage;

import model.TaiKhoan;

public class TaiKhoanDAO {
	
	// kiểm tra tên đăng nhập và mật khẩu
	public TaiKhoan selectByUserNameAndPassword(TaiKhoan tk) {
		TaiKhoan result = null;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM taikhoan WHERE tendangnhap = ? AND matkhau = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, tk.getTenDangnhap());
			st.setString(2,tk.getMatKhau());
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String maTaiKhoan = rs.getString("id_taikhoan");
				String tenDangnhap = rs.getString("tendangnhap");
				String matKhau = rs.getString("matkhau");
				
				result = new TaiKhoan(maTaiKhoan, tenDangnhap, matKhau);
				break;
			}
			JDBCUtil.closeConnection(con);
			
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		
		return result;
	}
	
	// thêm tài khoản vào database
	public void themTaiKhoan(TaiKhoan tk, String chucvu) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO taikhoan VALUES(?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,tk.getMaTaiKhoan());
			st.setString(2, tk.getTenDangnhap());
			st.setString(3, tk.getMatKhau());
			st.setString(4, chucvu);
			st.executeUpdate();
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}


	// kiểm tra đã có tên đăng nhập chưa -> dùng cho đăng ký mới tài khoản
	public boolean kiemTraTenDangNhap(String tenDangNhap) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM taikhoan WHERE tendangnhap = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, tenDangNhap);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				return true;
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return false;
	}

	
	// thay đổi mật khẩu
	public void thayDoiMatKhau(TaiKhoan taiKhoan) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE taikhoan SET matkhau = ? WHERE id_taikhoan = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, taiKhoan.getMatKhau());
			st.setString(2, taiKhoan.getMaTaiKhoan());
			st.executeUpdate();
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}
	
	public static void main(String[] args) {
	}	
}
