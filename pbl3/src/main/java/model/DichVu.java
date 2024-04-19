package model;

public class DichVu {
	String maDichVu;
	String tenKhauPhanAn;
	int khoiLuongHanhLy;
	double gia;
	
	public DichVu() {
		
	}
	public DichVu(String maDichVu, String tenKhauPhanAn, int khoiLuongHanhLy, double gia) {
		this.maDichVu = maDichVu;
		this.tenKhauPhanAn = tenKhauPhanAn;
		this.khoiLuongHanhLy = khoiLuongHanhLy;
		this.gia = gia;
	}
	public String getMaDichVu() {
		return maDichVu;
	}
	public void setMaDichVu(String maDichVu) {
		this.maDichVu = maDichVu;
	}
	public String getTenKhauPhanAn() {
		return tenKhauPhanAn;
	}
	public void setTenKhauPhanAn(String tenKhauPhanAn) {
		this.tenKhauPhanAn = tenKhauPhanAn;
	}
	public int getKhoiLuongHanhLy() {
		return khoiLuongHanhLy;
	}
	public void setKhoiLuongHanhLy(int khoiLuongHanhLy) {
		this.khoiLuongHanhLy = khoiLuongHanhLy;
	}
	public double getGia() {
		return gia;
	}
	public void setGia(double gia) {
		this.gia = gia;
	}
	
	
	
}
