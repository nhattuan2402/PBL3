package model;

import java.sql.Date;
import java.sql.Time;
import java.util.Objects;

public class ChuyenBay {
	String maChuyenBay;
	String maMayBay;
	String diemDi;
	String diemDen;
	Date ngayBay;
	Time gioBay;
	int gia;
	public ChuyenBay() {
		
	}

	public ChuyenBay(String maChuyenBay, String maMayBay, String diemDi, String diemDen, Date ngayBay, Time gioBay, int gia ) {
		this.maChuyenBay = maChuyenBay;
		this.maMayBay = maMayBay;
		this.diemDi = diemDi;
		this.diemDen = diemDen;
		this.ngayBay = ngayBay;
		this.gioBay = gioBay;
		this.gia = gia;
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

	public int getGia() {
		return gia;
	}

	public void setGia(int gia) {
		this.gia = gia;
	}

	@Override
	public String toString() {
		return "ChuyenBay [maChuyenBay=" + maChuyenBay + ", maMayBay=" + maMayBay + ", diemDi=" + diemDi + ", diemDen="
				+ diemDen + ", ngayBay=" + ngayBay + ", gioBay=" + gioBay + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(diemDen, diemDi, gia, gioBay, maChuyenBay, maMayBay, ngayBay);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ChuyenBay other = (ChuyenBay) obj;
		return Objects.equals(diemDen, other.diemDen) && Objects.equals(diemDi, other.diemDi) && gia == other.gia
				&& Objects.equals(gioBay, other.gioBay) && Objects.equals(maChuyenBay, other.maChuyenBay)
				&& Objects.equals(maMayBay, other.maMayBay) && Objects.equals(ngayBay, other.ngayBay);
	}
	
	
	
}
