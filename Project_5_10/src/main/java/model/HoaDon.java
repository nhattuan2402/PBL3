package model;

import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;

public class HoaDon {
	String maHoaDon;
	String maKhachHang;
	String maChuyenBayDi;
	String maChuyenBayVe;
	ArrayList<String> maGheDi;
	ArrayList<String> maGheVe;
	int donGia;
	Date ngayDat;
	Time gioThanhToan;
	public HoaDon() {
		
	}

	public HoaDon(String maHoaDon, String maKhachHang, String maChuyenBayDi, String maChuyenBayVe,
			ArrayList<String> maGheDi, ArrayList<String> maGheVe, int donGia, Date ngayDat, Time gioThanhToan) {
		this.maHoaDon = maHoaDon;
		this.maKhachHang = maKhachHang;
		this.maChuyenBayDi = maChuyenBayDi;
		this.maChuyenBayVe = maChuyenBayVe;
		this.maGheDi = maGheDi;
		this.maGheVe = maGheVe;
		this.donGia = donGia;
		this.ngayDat = ngayDat;
		this.gioThanhToan = gioThanhToan;
	}

	public String getMaHoaDon() {
		return maHoaDon;
	}

	public void setMaHoaDon(String maHoaDon) {
		this.maHoaDon = maHoaDon;
	}

	public String getMaKhachHang() {
		return maKhachHang;
	}

	public void setMaKhachHang(String maKhachHang) {
		this.maKhachHang = maKhachHang;
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

	public ArrayList<String> getMaGheDi() {
		return maGheDi;
	}

	public void setMaGheDi(ArrayList<String> maGheDi) {
		this.maGheDi = maGheDi;
	}

	public ArrayList<String> getMaGheVe() {
		return maGheVe;
	}

	public void setMaGheVe(ArrayList<String> maGheVe) {
		this.maGheVe = maGheVe;
	}

	public int getDonGia() {
		return donGia;
	}

	public void setDonGia(int donGia) {
		this.donGia = donGia;
	}

	public Date getNgayDat() {
		return ngayDat;
	}

	public void setNgayDat(Date ngayDat) {
		this.ngayDat = ngayDat;
	}

	public Time getGioThanhToan() {
		return gioThanhToan;
	}

	public void setGioThanhToan(Time gioThanhToan) {
		this.gioThanhToan = gioThanhToan;
	}

	
	
}
