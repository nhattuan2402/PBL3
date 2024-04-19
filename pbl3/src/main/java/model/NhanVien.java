package model;

import java.sql.Date;

public class NhanVien extends TaiKhoan {
	String maNhanVien;

	public String getMaNhanVien() {
		return maNhanVien;
	}
	

	public NhanVien() {
		super();
	}
	
	public NhanVien(String maNhanVien,String hoVaTen, Date ngaySinh, String soDienThoai,
			String email, String diaChi, boolean gioiTinh, 
			String maTaiKhoan, String tenDangNhap, String matKhau) {
		super(hoVaTen, ngaySinh, soDienThoai, email, diaChi, gioiTinh, maTaiKhoan, tenDangNhap, matKhau);
		this.maNhanVien = maNhanVien;
	}


	public void setMaNhanVien(String maNhanVien) {
		this.maNhanVien = maNhanVien;
	}


	@Override
	public String toString() {
		return "NhanVien [maNhanVien=" + maNhanVien + ", maTaiKhoan=" + maTaiKhoan + ", tenDangnhap=" + tenDangnhap
				+ ", matKhau=" + matKhau + ", hoVaTen=" + hoVaTen + ", ngaySinh=" + ngaySinh + ", email=" + email
				+ ", soDienThoai=" + soDienThoai + ", diaChi=" + diaChi + ", gioiTinh=" + gioiTinh + "]";
	}
	
	
	
}
