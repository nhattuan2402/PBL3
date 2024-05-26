package model;

import java.sql.Date;

public class ThongBao {
	String maThongBao;
	String tenThongBao;
	Date thoiGian;
	String noiDung;
	
	public ThongBao() {}
	
	public ThongBao(String maThongBao, String tenThongBao, Date thoiGian, String noiDung) {
		this.maThongBao = maThongBao;
		this.tenThongBao = tenThongBao;
		this.thoiGian = thoiGian;
		this.noiDung = noiDung;
	}

	public String getMaThongBao() {
		return maThongBao;
	}

	public void setMaThongBao(String maThongBao) {
		this.maThongBao = maThongBao;
	}
	
	

	public String getTenThongBao() {
		return tenThongBao;
	}

	public void setTenThongBao(String tenThongBao) {
		this.tenThongBao = tenThongBao;
	}

	public Date getThoiGian() {
		return thoiGian;
	}

	public void setThoiGian(Date thoiGian) {
		this.thoiGian = thoiGian;
	}

	public String getNoiDung() {
		return noiDung;
	}

	public void setNoiDung(String noiDung) {
		this.noiDung = noiDung;
	}
	
	
}
