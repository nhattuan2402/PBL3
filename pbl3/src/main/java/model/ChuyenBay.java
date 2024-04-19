package model;

import java.sql.Date;

public class ChuyenBay {
	String maChuyenBay;
//	String maNhanVien;
	String maMayBay;
	String maLichBay;
	String maTuyenBay;
	Date ngayBay;
	
	public ChuyenBay() {
		
	}

	public ChuyenBay(String maChuyenBay,  String maMayBay, String maLichBay, String maTuyenBay, Date ngayBay) {
		this.maChuyenBay = maChuyenBay;
//		this.maNhanVien = maNhanVien;
		this.maMayBay = maMayBay;
		this.maLichBay = maLichBay;
		this.maTuyenBay = maTuyenBay;
		this.ngayBay = ngayBay;
	}

	public String getMaChuyenBay() {
		return maChuyenBay;
	}

	public void setMaChuyenBay(String maChuyenBay) {
		this.maChuyenBay = maChuyenBay;
	}

	public String getMaMayBay() {
		return maMayBay;
	}

	public void setMaMayBay(String maMayBay) {
		this.maMayBay = maMayBay;
	}
	
	public String getMaLichBay() {
		return maLichBay;
	}

	public void setMaLichBay(String maLichBay) {
		this.maLichBay = maLichBay;
	}


	public String getMaTuyenBay() {
		return maTuyenBay;
	}

	public void setMaTuyenBay(String maTuyenBay) {
		this.maTuyenBay = maTuyenBay;
	}

	public Date getNgayBay() {
		return ngayBay;
	}

	public void setNgayBay(Date ngayBay) {
		this.ngayBay = ngayBay;
	}

	@Override
	public String toString() {
		return "ChuyenBay [maChuyenBay=" + maChuyenBay + ", maMayBay=" + maMayBay + ", maLichBay=" + maLichBay
				+ ", maTuyenBay=" + maTuyenBay + ", ngayBay=" + ngayBay + "]";
	}

	

	
	
}
