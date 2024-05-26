package model;

import java.sql.Date;

public class Admin extends Nguoi {
	String maAdmin;
	TaiKhoan taiKhoan;

	public Admin() {

	}

	public Admin(String maAdmin, TaiKhoan taiKhoan, String hoVaTen, Date ngaySinh, String soDienThoai, String email,
			String diaChi, boolean gioiTinh) {
		super(hoVaTen, ngaySinh, soDienThoai, email, diaChi, gioiTinh);
		this.maAdmin = maAdmin;
		this.taiKhoan = taiKhoan;
	}

	public String getMaAdmin() {
		return maAdmin;
	}

	public void setMaAdmin(String maAdmin) {
		this.maAdmin = maAdmin;
	}

	public TaiKhoan getTaiKhoan() {
		return taiKhoan;
	}

	public void setTaiKhoan(TaiKhoan taiKhoan) {
		this.taiKhoan = taiKhoan;
	}

}
