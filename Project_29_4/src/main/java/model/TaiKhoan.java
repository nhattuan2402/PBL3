package model;

public class TaiKhoan {
	
	
	String maTaiKhoan;
	String tenDangNhap;
	String matKhau;
	String role;
	
	public TaiKhoan(String maTaiKhoan, String tenDangNhap, String matKhau, String role) {
		this.maTaiKhoan = maTaiKhoan;
		this.tenDangNhap = tenDangNhap;
		this.matKhau = matKhau;
		this.role = role;
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
		return tenDangNhap;
	}
	public void setTenDangNhap(String tenDangNhap) {
		this.tenDangNhap = tenDangNhap;
	}
	public String getMatKhau() {
		return matKhau;
	}
	public void setMatKhau(String matKhau) {
		this.matKhau = matKhau;
	}
	
	

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getTenDangNhap() {
		return tenDangNhap;
	}

	@Override
	public String toString() {
		return "TaiKhoan [maTaiKhoan=" + maTaiKhoan + ", tenDangnhap=" + tenDangNhap + ", matKhau=" + matKhau + "]";
	}
	
	public static void main(String[] args) {
		TaiKhoan tk = new TaiKhoan();
		System.out.println(tk.toString());
	}
	
}
