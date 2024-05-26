package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

import model.ChuyenBay;
import model.HoaDon;

public class HoaDonDAO {
	
	public static ArrayList<HoaDon> selectByIDKhachHang(String id) {
		ArrayList<HoaDon> allHoaDon = new ArrayList<HoaDon>();
		try {
			Connection con = JDBCUtil.getConnection();
			String query = "select * from hoadon where id_khachhang = ?";
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, id);
			ResultSet rs  = st.executeQuery();
			while(rs.next()) {
				HoaDon hd = new HoaDon();
				hd.setMaHoaDon(rs.getString("id_hoadon"));
				hd.setMaKhachHang(rs.getString("id_khachhang"));
				hd.setMaChuyenBayDi(rs.getString("machuyenbaydi"));
				hd.setMaChuyenBayVe(rs.getString("machuyenbayve"));
				hd.setDonGia(rs.getInt("dongia"));
				hd.setNgayDat(rs.getDate("ngaydat"));
				hd.setGioThanhToan(rs.getTime("giothanhtoan"));
				allHoaDon.add(hd);
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return allHoaDon;
	}
	
	public static ArrayList<ChuyenBay> allDi() {
		ArrayList<ChuyenBay> CBDi = new ArrayList<ChuyenBay>();
		try {
			Connection con = JDBCUtil.getConnection();
			String query1 = "select * from hoadon";
			PreparedStatement st = con.prepareStatement(query1);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String maCBDi = rs.getString("machuyenbaydi");
				ChuyenBay cb = new ChuyenBayDAO().selectByID(maCBDi);
				CBDi.add(cb);
			}
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return CBDi;
	}
	
	public static ArrayList<ChuyenBay> allVe() {
			ArrayList<ChuyenBay> CBVe = new ArrayList<ChuyenBay>();
			try {
				Connection con = JDBCUtil.getConnection();
				String query1 = "select * from hoadon";
				PreparedStatement st = con.prepareStatement(query1);
				ResultSet rs = st.executeQuery();
				while(rs.next()) {
					String maCBVe = rs.getString("machuyenbayve")+"";
					if(!maCBVe.equals("")) {						
						ChuyenBay cb = new ChuyenBayDAO().selectByID(maCBVe);
						CBVe.add(cb);
					}
				}
				JDBCUtil.closeConnection(con);	
			} catch (Exception e) {
				e.printStackTrace();
			}
			return CBVe;
		}
	
	public static void themHoaDon(HoaDon hd) {
		try {
			Connection con = JDBCUtil.getConnection();
			String query = "insert into hoadon values(?,?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, hd.getMaHoaDon());
			st.setString(2, hd.getMaKhachHang());
			st.setString(3, hd.getMaChuyenBayDi());
			st.setString(4, hd.getMaChuyenBayVe());
			st.setDouble(5, hd.getDonGia());
			st.setDate(6, hd.getNgayDat());
			st.setTime(7, hd.getGioThanhToan());
			st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public static void main(String[] args) {
		for(ChuyenBay hd : allVe()) {
			System.out.println(hd.toString());
		}
	}

	public ArrayList<HoaDon> selectAll() {
		ArrayList<HoaDon> allHoaDon = new ArrayList<HoaDon>();
        try {
            Connection con = JDBCUtil.getConnection();
            String query = "select * from hoadon";
            PreparedStatement st = con.prepareStatement(query);
            ResultSet rs  = st.executeQuery();
            ResultSetMetaData rsmd = rs.getMetaData();
            int columnsNumber = rsmd.getColumnCount();
            while(rs.next()) {
            	for (int i = 1; i <= columnsNumber; i++) {
            		System.out.print(rs.getString(i) + "\t");
            	}
            	System.out.println("\n");
            	
                HoaDon hd = new HoaDon();
                hd.setMaHoaDon(rs.getString("id_hoadon"));
                hd.setMaKhachHang(rs.getString("id_khachhang"));
                hd.setMaChuyenBayDi(rs.getString("machuyenbaydi"));
                hd.setMaChuyenBayVe(rs.getString("machuyenbayve"));
                hd.setDonGia(rs.getInt("dongia"));
                hd.setNgayDat(rs.getDate("ngaydat"));
                hd.setGioThanhToan(rs.getTime("giothanhtoan"));
                allHoaDon.add(hd);
            }
            JDBCUtil.closeConnection(con);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return allHoaDon;
	}
}


