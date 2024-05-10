package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;

import model.HoTro;

public class HoTroDAO implements DAOInterface<HoTro>{

	@Override
	public ArrayList<HoTro> selectAll() {
		ArrayList<HoTro> danhSachHoTro = new ArrayList<HoTro>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM yeucauhotro";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			System.out.println("\n");
			while(rs.next()) {
				String maHoTro = rs.getString("id_hotro");
				String tieuDe = rs.getString("tieude");
				String email = rs.getString("email");
				Date thoiGian = rs.getDate("thoigian");
				String mota = rs.getString("mota");
				boolean trangThai = rs.getBoolean("trangthai");
				HoTro ht = new HoTro(maHoTro, tieuDe, email, thoiGian, mota, trangThai);
				danhSachHoTro.add(ht);
			}
			rs.close();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return danhSachHoTro;
	}

	@Override
	public HoTro selectByID(HoTro t) {
		HoTro hoTro = new HoTro();
		try {
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void Add(HoTro t) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO yeucauhotro VALUES(?,?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaHoTro());
			st.setString(2, t.getTieuDe());
			st.setString(3, t.getEmail());
			st.setDate(4, t.getThoiGian());
			st.setString(5, t.getMoTa());
			st.setBoolean(6, t.isTrangThai());
			st.executeUpdate();
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void Update(HoTro t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void Delete(HoTro t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public HoTro selectByID(String id) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
