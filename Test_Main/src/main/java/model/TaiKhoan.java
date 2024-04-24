package model;

public class TaiKhoan {
	
	
	String maTaiKhoan;
	String tenDangnhap;
	String matKhau;
	
	public TaiKhoan(String maTaiKhoan, String tenDangnhap, String matKhau) {
		this.maTaiKhoan = maTaiKhoan;
		this.tenDangnhap = tenDangnhap;
		this.matKhau = matKhau;
	}
	
	public TaiKhoan() {
	
	}
	
	public String getMaTaiKhoan() {
		return maTaiKhoan;
	}
	public void setMaTaiKhoan(String maTaiKhoan) {
		this.maTaiKhoan = maTaiKhoan;
	}
	public String getTenDangnhap() {
		return tenDangnhap;
	}
	public void setTenDangnhap(String tenDangnhap) {
		this.tenDangnhap = tenDangnhap;
	}
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}

	@Override
	public String toString() {
		return "TaiKhoan [maTaiKhoan=" + maTaiKhoan + ", tenDangnhap=" + tenDangnhap + ", matKhau=" + matKhau + "]";
	}
	
	public static void main(String[] args) {
		
	}
	
}
