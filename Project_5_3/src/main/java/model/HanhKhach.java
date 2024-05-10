package model;

import java.sql.Date;

public class HanhKhach extends Nguoi {
	String maHanhKhach;
	String soCCCD;
	String quocTich;
	String maChuyenBayDi;
	String maChuyenBayVe;
	String maGheDi;
	String maGheVe;
	
	public HanhKhach() {
		
	}

	public HanhKhach(String maHanhKhach, String hoVaTen, Date ngaySinh, String soDienThoai,
			String email, String diaChi, boolean gioiTinh, 
			 String soCCCD, String quocTich, String maChuyenBayDi, String maChuyenBayVe, String maGheDi, String maGheVe) {
		super(hoVaTen, ngaySinh, soDienThoai,email, diaChi, gioiTinh);
		this.maHanhKhach = maHanhKhach;
		this.soCCCD = soCCCD;
		this.quocTich = quocTich;
		this.maChuyenBayDi = maChuyenBayDi;
		this.maChuyenBayVe = maChuyenBayVe;
		this.maGheDi = maGheDi;
		this.maGheVe = maGheDi;
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

	public String getMaChuyenBayDi() {
		return maChuyenBayDi;
	}

	public void setMaChuyenBayDi(String maChuyenBayDi) {
		this.maChuyenBayDi = maChuyenBayDi;
	}

	public String getMaChuyenBayVe() {
		return maChuyenBayVe;
	}

	public void setMaChuyenBayVe(String maChuyenBayVe) {
		this.maChuyenBayVe = maChuyenBayVe;
	}

	public String getMaGheDi() {
		return maGheDi;
	}

	public void setMaGheDi(String maGheDi) {
		this.maGheDi = maGheDi;
	}

	public String getMaGheVe() {
		return maGheVe;
	}

	public void setMaGheVe(String maGheVe) {
		this.maGheVe = maGheVe;
	}
	
	
	
	
}
