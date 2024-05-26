package model;

import java.sql.Date;

public class KhachHang extends Nguoi {
	String maKhachHang;
	String maTaiKhoan;

	public KhachHang() {

	}

	public KhachHang(String maKhachHang, String maTaiKhoan, String hoVaTen, Date ngaySinh, String soDienThoai,
			String email, String diaChi, boolean gioiTinh) {
		super(hoVaTen, ngaySinh, soDienThoai, email, diaChi, gioiTinh);
		this.maKhachHang = maKhachHang;
		this.maTaiKhoan = maTaiKhoan;
	}

	public String getMaKhachHang() {
		return maKhachHang;
	}

	public void setMaKhachHang(String maKhachHang) {
		this.maKhachHang = maKhachHang;
	}

	public String getMaTaiKhoan() {
		return maTaiKhoan;
	}

	public void setMaTaiKhoan(String maTaiKhoan) {
		this.maTaiKhoan = maTaiKhoan;
	}

	@Override
	public String toString() {
		return "KhachHang [maKhachHang=" + maKhachHang + ", maTaiKhoan=" + maTaiKhoan + "]";
	}
	
	

}
