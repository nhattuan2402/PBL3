package model;

public class TuyenBay {
	String maTuyenBay;
	String noiCatCanh;
	String noiHaCanh;
	
	public TuyenBay() {
		
	}

	public TuyenBay(String maTuyenBay, String noiCatCanh, String noiHaCanh) {
		this.maTuyenBay = maTuyenBay;
		this.noiCatCanh = noiCatCanh;
		this.noiHaCanh = noiHaCanh;
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
	
	
	
}
