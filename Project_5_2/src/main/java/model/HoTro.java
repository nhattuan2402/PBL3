package model;

import java.sql.Date;

public class HoTro {
	String maHoTro;
	String tieuDe;
	String email;
	Date thoiGian;
	String moTa;
	boolean trangThai;
	
	public HoTro() {}

	public HoTro(String maHoTro, String tieuDe, String email, Date thoiGian, String moTa, boolean trangThai) {
		this.maHoTro = maHoTro;
		this.tieuDe = tieuDe;
		this.email = email;
		this.thoiGian = thoiGian;
		this.moTa = moTa;
		this.trangThai = trangThai;
	}

	public String getMaHoTro() {
		return maHoTro;
	}

	public void setMaHoTro(String maHoTro) {
		this.maHoTro = maHoTro;
	}

	public String getTieuDe() {
		return tieuDe;
	}

	public void setTieuDe(String tieuDe) {
		this.tieuDe = tieuDe;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getThoiGian() {
		return thoiGian;
	}

	public void setThoiGian(Date thoiGian) {
		this.thoiGian = thoiGian;
	}

	public String getMoTa() {
		return moTa;
	}

	public void setMoTa(String moTa) {
		this.moTa = moTa;
	}

	public boolean isTrangThai() {
		return trangThai;
	}

	public void setTrangThai(boolean trangThai) {
		this.trangThai = trangThai;
	}
	
	
	
}
