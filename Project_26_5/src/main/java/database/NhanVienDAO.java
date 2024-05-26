package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

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
			NhanVien result = null;
			try {
				Connection con = JDBCUtil.getConnection();
				String sql = "SELECT * FROM nhanvien WHERE id_taikhoan = ?";
				PreparedStatement st = con.prepareStatement(sql);
				st.setString(1, maTaiKhoan);
				ResultSet rs = st.executeQuery();
				while(rs.next()) {
					String maNhanVien = rs.getString("id_nhanvien");
					String hoVaTen = rs.getString("hovaten");
					String ngaySinh = rs.getString("ngaysinh");
					String email = rs.getString("email");
					String soDienThoai = rs.getString("sodienthoai");
					String diaChi = rs.getString("diachi");
					boolean gioiTinh = rs.getBoolean("gioiTinh");
					
					result = new NhanVien(maNhanVien, maTaiKhoan, hoVaTen, Date.valueOf(ngaySinh), email, soDienThoai, diaChi, gioiTinh);
				}
				
			} catch (Exception e) {
				System.err.println(e.toString());
			}
			return result;
		}

		public ArrayList<NhanVien> timKiemNhanVien(String sapxep, String input) {
			ArrayList<NhanVien> result = new ArrayList<NhanVien>();
			try {
				Connection con = JDBCUtil.getConnection();
				String sql = "SELECT * FROM NHANVIEN WHERE 1=1 ";
				PreparedStatement st = null;
				
				
				if (!input.equals("")) {
					if (sapxep.equals("2")) {
						sql += "AND hovaten LIKE ?";
					} else if (sapxep.equals("3")) {
						sql += "AND email LIKE ?";
					} else if (sapxep.equals("4")) {
						sql += "AND diachi LIKE ?";
					}
				}
				st = con.prepareStatement(sql);
				
				if (!input.equals("")) {
                    st.setString(1, "%" + input + "%");
                }
				ResultSet rs = st.executeQuery();
				
				while (rs.next()) {
					String maNhanVien = rs.getString("id_nhanvien");
                    String maTaiKhoan = rs.getString("id_taikhoan");
                    String hoVaTen = rs.getString("hovaten");
                    String ngaySinh = rs.getString("ngaysinh");
                    String email = rs.getString("email");
                    String soDienThoai = rs.getString("sodienthoai");
                    String diaChi = rs.getString("diachi");
                    boolean gioiTinh = rs.getBoolean("gioiTinh");

                    NhanVien nv = new NhanVien(maNhanVien, maTaiKhoan, hoVaTen, Date.valueOf(ngaySinh), email,
                            soDienThoai, diaChi, gioiTinh);
                    result.add(nv);
				} ;
				rs.close();
				JDBCUtil.closeConnection(con);
				
			} catch (Exception e) {
				System.err.println(e.toString());
			}
			return result;
		}

		public String getMaxMaNhanVien() {
			String result = null;
			try {
				Connection con = JDBCUtil.getConnection();
				String sql = "SELECT MAX(id_nhanvien) FROM nhanvien";
				PreparedStatement st = con.prepareStatement(sql);
				ResultSet rs = st.executeQuery();
				while (rs.next()) {
					result = rs.getString(1);
					break;
				}
				JDBCUtil.closeConnection(con);
			} catch (Exception e) {
				System.err.println(e.toString());
			}
			return result;
		}

		public ArrayList<NhanVien> selectAll() {
			ArrayList<NhanVien> result = new ArrayList<NhanVien>();
			try {
				Connection con = JDBCUtil.getConnection();
				String sql = "SELECT * FROM nhanvien";
				PreparedStatement st = con.prepareStatement(sql);
				ResultSet rs = st.executeQuery();
				ResultSetMetaData rsmd  = rs.getMetaData();
				int soCot = rsmd.getColumnCount();
				while (rs.next()) {
					for(int i=1;i<=soCot;i++) {
						System.out.print(rs.getObject(i)+"\t");
					}
					System.out.println();
					
					String maNhanVien = rs.getString("id_nhanvien");
					String maTaiKhoan = rs.getString("id_taikhoan");
					String hoVaTen = rs.getString("hovaten");
					String ngaySinh = rs.getString("ngaysinh");
					String email = rs.getString("email");
					String soDienThoai = rs.getString("sodienthoai");
					String diaChi = rs.getString("diachi");
					boolean gioiTinh = rs.getBoolean("gioiTinh");

					NhanVien nv = new NhanVien(maNhanVien, maTaiKhoan, hoVaTen, Date.valueOf(ngaySinh), email,
							soDienThoai, diaChi, gioiTinh);
					result.add(nv);
				}

			} catch (Exception e) {
				System.err.println(e.toString());
			}
			return result;
		}
}
