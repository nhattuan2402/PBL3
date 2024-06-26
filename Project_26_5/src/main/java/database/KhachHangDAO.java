package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

import model.KhachHang;
import model.TaiKhoan;

public class KhachHangDAO {
	
	// xem toàn bộ khách hàng
	public static void xemChiTietMotKhachHang(TaiKhoan tk) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM khachhang WHERE  id_taikhoan = ? ";
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
	
	
	// cập nhật thông tin khách hàng
	public static void capNhatThongTin(KhachHang kh) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "UPDATE khachhang SET  hovaten = ?, ngaysinh =?, diachi = ?, gioitinh = ? where id_khachhang = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, kh.getHoVaTen());
			st.setDate(2, kh.getNgaySinh());
			st.setString(3, kh.getDiaChi());
			st.setBoolean(4, kh.isGioiTinh());
			st.setString(5, kh.getMaKhachHang());
			st.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// thêm khách hàng
	public static void themKhachHang(KhachHang kh, TaiKhoan tk) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql1 = "INSERT INTO khachhang VALUES(?,?,?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql1);
			st.setString(1,kh.getMaKhachHang());
			st.setString(2,kh.getMaTaiKhoan());
			st.setString(3,kh.getHoVaTen());
			st.setDate(4,kh.getNgaySinh());
			st.setString(5,kh.getEmail());
			st.setString(6,kh.getSoDienThoai());
			st.setString(7,kh.getDiaChi());
			st.setBoolean(8,kh.isGioiTinh());
			st.executeUpdate();
			
			TaiKhoanDAO tkd = new TaiKhoanDAO();
			tkd.themTaiKhoan(tk);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {

	}

	// lấy ra khách hàng dựa trên mã tài khoản
	public KhachHang selectByMaTaiKhoan(String maTaiKhoan) {
		KhachHang result = null;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM khachhang WHERE id_taikhoan = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, maTaiKhoan);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String maKhachHang = rs.getString("id_khachhang");
				String hoVaTen = rs.getString("hovaten");
				String ngaySinh = rs.getString("ngaysinh");
				String soDienThoai = rs.getString("sodienthoai");
				String email = rs.getString("email");
				String diaChi = rs.getString("diachi");
				boolean gioiTinh = rs.getBoolean("gioiTinh");
				
				result = new KhachHang(maKhachHang, maTaiKhoan, hoVaTen, Date.valueOf(ngaySinh), soDienThoai, email, diaChi, gioiTinh);
				break;
			}
			
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return result;
	}


	// lấy ra khách hàng dựa trên mã khách hàng
	public static KhachHang selectByMaKhachHang(KhachHang kh) {
		KhachHang result = null;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM khachhang WHERE id_khachhang = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, kh.getMaKhachHang());
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String maTaiKhoan = rs.getString("id_taikhoan");
				String hoVaTen = rs.getString("hovaten");
				String ngaySinh = rs.getString("ngaysinh");
				String email = rs.getString("email");
				String soDienThoai = rs.getString("sodienthoai");
				String diaChi = rs.getString("diachi");
				boolean gioiTinh = rs.getBoolean("gioiTinh");
				
				result = new KhachHang(kh.getMaKhachHang(), maTaiKhoan, hoVaTen, Date.valueOf(ngaySinh), email, soDienThoai, diaChi, gioiTinh);
				break;
			}
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return result;
	}


	public ArrayList<KhachHang> timKiemKhachHang(String sapxep, String input_text) {
		ArrayList<KhachHang> result = new ArrayList<KhachHang>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM khachhang WHERE 1=1 ";
			PreparedStatement st = null;
			
			if (!input_text.equals("")) {
				if (sapxep.equals("2")) {
					sql += "AND hovaten LIKE ?";
				} else if (sapxep.equals("3")) {
					sql += "AND email LIKE ?";
				} else if (sapxep.equals("4")) {
					sql += "AND diachi LIKE ?";
				} 
			}
				st = con.prepareStatement(sql);
				
				if (!input_text.equals("")) {
					st.setString(1, "%" + input_text + "%");
				}
				ResultSet rs = st.executeQuery();
				while (rs.next()) {
					String maKhachHang = rs.getString("id_khachhang");
					String maTaiKhoan = rs.getString("id_taikhoan");
					String hoVaTen = rs.getString("hovaten");
					String ngaySinh = rs.getString("ngaysinh");
					String email = rs.getString("email");
					String soDienThoai = rs.getString("sodienthoai");
					String diaChi = rs.getString("diachi");
					boolean gioiTinh = rs.getBoolean("gioiTinh");
					KhachHang kh = new KhachHang(maKhachHang, maTaiKhoan, hoVaTen, Date.valueOf(ngaySinh), email,
							soDienThoai, diaChi, gioiTinh);
					result.add(kh);
				}
				rs.close();
				JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return result;
	}


	public ArrayList<KhachHang> selectAll() {
		ArrayList<KhachHang> result = new ArrayList<KhachHang>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM khachhang";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			ResultSetMetaData rsmd = rs.getMetaData();
			int soCot = rsmd.getColumnCount();
			while (rs.next()) {
				for (int i = 1; i <= soCot; i++) {
					System.out.print(rs.getObject(i) + "\t");
				}
				System.out.println();

				String maKhachHang = rs.getString("id_khachhang");
				String maTaiKhoan = rs.getString("id_taikhoan");
				String hoVaTen = rs.getString("hovaten");
				String ngaySinh = rs.getString("ngaysinh");
				String email = rs.getString("email");
				String soDienThoai = rs.getString("sodienthoai");
				String diaChi = rs.getString("diachi");
				boolean gioiTinh = rs.getBoolean("gioiTinh");

				KhachHang kh = new KhachHang(maKhachHang, maTaiKhoan, hoVaTen, Date.valueOf(ngaySinh), email,
						soDienThoai, diaChi, gioiTinh);
				result.add(kh);
			}

		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return result;
	}
}
