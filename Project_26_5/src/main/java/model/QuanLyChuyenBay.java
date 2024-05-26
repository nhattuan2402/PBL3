package model;

public class QuanLyChuyenBay {
	String maQuanLy;
	String maKhachHang;
	ChuyenBay chuyenBay;
	int soHanhKhach;
	
	public QuanLyChuyenBay() {}

	public QuanLyChuyenBay(String maQuanLy, String maKhachHang, ChuyenBay chuyenBay, int soHanhKhach) {
		this.maQuanLy = maQuanLy;
		this.maKhachHang = maKhachHang;
		this.chuyenBay = chuyenBay;
		this.soHanhKhach = soHanhKhach;
	}

	public String getMaQuanLy() {
		return maQuanLy;
	}

	public void setMaQuanLy(String maQuanLy) {
		this.maQuanLy = maQuanLy;
	}

	public String getMaKhachHang() {
		return maKhachHang;
	}

	public void setMaKhachHang(String maKhachHang) {
		this.maKhachHang = maKhachHang;
	}

	public ChuyenBay getChuyenBay() {
		return chuyenBay;
	}

	public void setChuyenBay(ChuyenBay chuyenBay) {
		this.chuyenBay = chuyenBay;
	}

	public int getSoHanhKhach() {
		return soHanhKhach;
	}

	public void setSoHanhKhach(int soHanhKhach) {
		this.soHanhKhach = soHanhKhach;
	}

	@Override
	public String toString() {
		return "QuanLyChuyenBay [maQuanLy=" + maQuanLy + ", maKhachHang=" + maKhachHang + ", chuyenBay=" + chuyenBay
				+ ", soHanhKhach=" + soHanhKhach + "]";
	}

	
	
}