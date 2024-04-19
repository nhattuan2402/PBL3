package model;

import java.sql.Date;

public class KhachHang extends TaiKhoan{
	String maKhachHang;

	public String getMaKhachHang() {
		return maKhachHang;
	}
	

	public KhachHang() {
		super();
	}
	
	public KhachHang(String maKhachHang,String hoVaTen, Date ngaySinh, String soDienThoai,
			String email, String diaChi, boolean gioiTinh, 
			String maTaiKhoan, String tenDangNhap, String matKhau) {
		super(hoVaTen, ngaySinh, soDienThoai, email, diaChi, gioiTinh, maTaiKhoan, tenDangNhap, matKhau);
		this.maKhachHang = maKhachHang;
	}


	public void setMaNhanVien(String maKhachHang) {
		this.maKhachHang = maKhachHang;
	}


	@Override
	public String toString() {
		return "KhachHang [maKhachHang=" + maKhachHang + "]";
	}
	
	
}
