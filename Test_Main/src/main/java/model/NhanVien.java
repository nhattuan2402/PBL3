package model;

import java.sql.Date;

public class NhanVien extends Nguoi {
	String maNhanVien;
	String  maTaiKhoan;
	
	public NhanVien() {
		
	}

	public NhanVien(String maNhanVien,String maTaiKhoan, String hoVaTen, Date ngaySinh,   String soDienThoai, String email, String diaChi, boolean gioiTinh) {
		super(hoVaTen, ngaySinh, soDienThoai, email, diaChi, gioiTinh);
		this.maNhanVien = maNhanVien;
		this.maTaiKhoan = maTaiKhoan;
	}

	public String getMaNhanVien() {
		return maNhanVien;
	}

	public void setMaNhanVien(String maNhanVien) {
		this.maNhanVien = maNhanVien;
	}

	public String getMaTaiKhoan() {
		return maTaiKhoan;
	}

	public void setMaTaiKhoan(String maTaiKhoan) {
		this.maTaiKhoan = maTaiKhoan;
	}	
}
