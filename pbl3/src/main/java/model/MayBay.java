package model;

public class MayBay {
	String maMayBay;
	String loaiMayBay;
	int soHangGheThuongGia;
	int soHangGhePhoThong;
	int soGheHangThuongGia;
	int soGheHangPhoThong;
	
	
	
	public MayBay() {
		
	}

	

	public MayBay(String maMayBay, String loaiMayBay, int soHangGheThuongGia, int soHangGhePhoThong,
			int soGheHangThuongGia, int soGheHangPhoThong) {
		super();
		this.maMayBay = maMayBay;
		this.loaiMayBay = loaiMayBay;
		this.soHangGheThuongGia = soHangGheThuongGia;
		this.soHangGhePhoThong = soHangGhePhoThong;
		this.soGheHangThuongGia = soGheHangThuongGia;
		this.soGheHangPhoThong = soGheHangPhoThong;
	}



	public String getMaMayBay() {
		return maMayBay;
	}



	public void setMaMayBay(String maMayBay) {
		this.maMayBay = maMayBay;
	}



	public String getLoaiMayBay() {
		return loaiMayBay;
	}



	public void setLoaiMayBay(String loaiMayBay) {
		this.loaiMayBay = loaiMayBay;
	}



	public int getSoHangGheThuongGia() {
		return soHangGheThuongGia;
	}



	public void setSoHangGheThuongGia(int soHangGheThuongGia) {
		this.soHangGheThuongGia = soHangGheThuongGia;
	}



	public int getSoHangGhePhoThong() {
		return soHangGhePhoThong;
	}



	public void setSoHangGhePhoThong(int soHangGhePhoThong) {
		this.soHangGhePhoThong = soHangGhePhoThong;
	}



	public int getSoGheHangThuongGia() {
		return soGheHangThuongGia;
	}



	public void setSoGheHangThuongGia(int soGheHangThuongGia) {
		this.soGheHangThuongGia = soGheHangThuongGia;
	}



	public int getSoGheHangPhoThong() {
		return soGheHangPhoThong;
	}



	public void setSoGheHangPhoThong(int soGheHangPhoThong) {
		this.soGheHangPhoThong = soGheHangPhoThong;
	}

	
}
