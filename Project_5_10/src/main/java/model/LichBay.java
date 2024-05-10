package model;
import java.sql.Time;

public class LichBay {
	String maLichBay;
	Time thoiGianCatCanh;
	
	
	public LichBay() {}
	
	public LichBay(String maLichBay, Time thoiGianCatCanh) {
		this.maLichBay = maLichBay;
		this.thoiGianCatCanh = thoiGianCatCanh;
	}

	public String getMaLichBay() {
		return maLichBay;
	}

	public void setMaLichBay(String maLichBay) {
		this.maLichBay = maLichBay;
	}

	public Time getThoiGianCatCanh() {
		return thoiGianCatCanh;
	}

	public void setThoiGianCatCanh(Time thoiGianCatCanh) {
		this.thoiGianCatCanh = thoiGianCatCanh;
	}

	@Override
	public String toString() {
		return "LichBay [maLichBay=" + maLichBay + ", thoiGianCatCanh=" + thoiGianCatCanh + "]";
	}
	
	
}
