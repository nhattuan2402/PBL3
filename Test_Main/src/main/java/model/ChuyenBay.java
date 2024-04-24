package model;

import java.sql.Date;
import java.sql.Time;

public class ChuyenBay {
	String maChuyenBay;
	String maMayBay;
	String diemDi;
	String diemDen;
	Date ngayBay;
	Time gioBay;
	
	public ChuyenBay() {
		
	}

	public ChuyenBay(String maChuyenBay, String maMayBay, String diemDi, String diemDen, Date ngayBay, Time gioBay ) {
		this.maChuyenBay = maChuyenBay;
		this.maMayBay = maMayBay;
		this.diemDi = diemDi;
		this.diemDen = diemDen;
		this.ngayBay = ngayBay;
		this.gioBay = gioBay;
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

	public String getDiemDi() {
		return diemDi;
	}

	public void setDiemDi(String diemDi) {
		this.diemDi = diemDi;
	}

	public String getDiemDen() {
		return diemDen;
	}

	public void setDiemDen(String diemDen) {
		this.diemDen = diemDen;
	}

	public Date getNgayBay() {
		return ngayBay;
	}

	public void setNgayBay(Date ngayBay) {
		this.ngayBay = ngayBay;
	}

	public Time getGioBay() {
		return gioBay;
	}

	public void setGioBay(Time gioBay) {
		this.gioBay = gioBay;
	}


	@Override
	public String toString() {
		return "ChuyenBay [maChuyenBay=" + maChuyenBay + ", maMayBay=" + maMayBay + ", diemDi=" + diemDi + ", diemDen="
				+ diemDen + ", ngayBay=" + ngayBay + ", gioBay=" + gioBay + "]";
	}
	
	
	
}
