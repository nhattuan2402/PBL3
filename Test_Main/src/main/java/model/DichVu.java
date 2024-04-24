package model;

public class DichVu {
	String maDichVu;
	String tenKhauPhanAn;
	int khoiLuongHanhLy;
	int gia;
	
	public DichVu() {
		
	}
	public DichVu(String maDichVu, String tenKhauPhanAn, int khoiLuongHanhLy, int gia) {
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
	public int getGia() {
		return gia;
	}
	public void setGia(int gia) {
		this.gia = gia;
	}
	
	
	
}
