package model;

import java.sql.Date;

public class HanhKhach extends Nguoi {
	String maHanhKhach;
	String soCCCD;
	String quocTich;
	
	public HanhKhach() {
		
	}

	public HanhKhach(String maHanhKhach, String hoVaTen, Date ngaySinh, String soDienThoai,
			String email, String diaChi, boolean gioiTinh, 
			 String soCCCD, String quocTich) {
		super(hoVaTen, ngaySinh, soDienThoai,email, diaChi, gioiTinh);
		this.maHanhKhach = maHanhKhach;
		this.soCCCD = soCCCD;
		this.quocTich = quocTich;
	}

	public String getMaHanhKhach() {
		return maHanhKhach;
	}

	public void setMaHanhKhach(String maHanhKhach) {
		this.maHanhKhach = maHanhKhach;
	}
	
	public String getSoCCCD() {
		return soCCCD;
	}

	public void setSoCCCD(String soCCCD) {
		this.soCCCD = soCCCD;
	}

	public String getQuocTich() {
		return quocTich;
	}

	public void setQuocTich(String quocTich) {
		this.quocTich = quocTich;
	}
	
	
	
	
}
