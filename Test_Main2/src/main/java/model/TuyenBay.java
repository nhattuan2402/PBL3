package model;

public class TuyenBay {
	String maTuyenBay;
	String noiCatCanh;
	String noiHaCanh;
	double thoiGianBay;
	
	public TuyenBay() {
		
	}

	public TuyenBay(String maTuyenBay, String noiCatCanh, String noiHaCanh, double thoiGianBay) {
		this.maTuyenBay = maTuyenBay;
		this.noiCatCanh = noiCatCanh;
		this.noiHaCanh = noiHaCanh;
		this.thoiGianBay = thoiGianBay;
	}

	public String getMaTuyenBay() {
		return maTuyenBay;
	}

	public void setMaTuyenBay(String maTuyenBay) {
		this.maTuyenBay = maTuyenBay;
	}

	public String getNoiCatCanh() {
		return noiCatCanh;
	}

	public void setNoiCatCanh(String noiCatCanh) {
		this.noiCatCanh = noiCatCanh;
	}

	public String getNoiHaCanh() {
		return noiHaCanh;
	}

	public void setNoiHaCanh(String noiHaCanh) {
		this.noiHaCanh = noiHaCanh;
	}

	public double getThoiGianBay() {
		return thoiGianBay;
	}

	public void setThoiGianBay(double thoiGianBay) {
		this.thoiGianBay = thoiGianBay;
	}

	@Override
	public String toString() {
		return "TuyenBay [maTuyenBay=" + maTuyenBay + ", noiCatCanh=" + noiCatCanh + ", noiHaCanh=" + noiHaCanh
				+ ", thoiGianBay=" + thoiGianBay + "]";
	}

}
