package model;

import java.sql.Date;

public class TaiKhoan extends Nguoi {
	
	
	String maTaiKhoan;
	String tenDangnhap;
	String matKhau;
	
	public TaiKhoan(String maTaiKhoan, String tenDangnhap, String matKhau) {
		super();
		this.maTaiKhoan = maTaiKhoan;
		this.tenDangnhap = tenDangnhap;
		this.matKhau = matKhau;
	}
	
	public TaiKhoan() {
		super();
	}

	public TaiKhoan(String hoVaTen, Date ngaySinh, String soDienThoai,
			String email, String diaChi, boolean gioiTinh, 
			String maTaiKhoan, String tenDangNhap, String matKhau)
	{
		super(hoVaTen, ngaySinh, soDienThoai, email, diaChi, gioiTinh);
		this.maTaiKhoan = maTaiKhoan;
		this.tenDangnhap = tenDangNhap;
		this.matKhau = matKhau;
	}
	
	public String getMaTaiKhoan() {
		return maTaiKhoan;
	}
	public void setMaTaiKhoan(String maTaiKhoan) {
		this.maTaiKhoan = maTaiKhoan;
	}
	public String getTenDangnhap() {
		return tenDangnhap;
	}
	public void setTenDangnhap(String tenDangnhap) {
		this.tenDangnhap = tenDangnhap;
	}
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	
}
