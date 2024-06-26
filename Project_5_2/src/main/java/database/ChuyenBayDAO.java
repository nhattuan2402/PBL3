package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Time;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.protocol.Resultset;

import model.ChuyenBay;

public class ChuyenBayDAO implements DAOInterface<ChuyenBay> {

	@Override
	public ArrayList<ChuyenBay> selectAll() {
		ArrayList<ChuyenBay> result = new ArrayList<ChuyenBay>();
		
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM chuyenbay";
			
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			
			ResultSetMetaData rsmd = rs.getMetaData();
			int socot = rsmd.getColumnCount();
			
			for(int i=1;i<=socot;i++) {
				System.out.print(rsmd.getColumnLabel(i)+"   ");
			}
			System.out.println("\n");
			while(rs.next()) {
				for(int i=1;i<=socot;i++) {
					System.out.print(rs.getObject(i)+ "  ");
				}
				System.out.println("\n");
			}
			rs.close();
			JDBCUtil.closeConnection(con);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
 	}

	@Override
	public ChuyenBay selectByID(ChuyenBay t) {
		return null;
	}

	@Override
	public void Add(ChuyenBay t) {
		
	}

	@Override
	public void Update(ChuyenBay t) {
	    
	}

	@Override
	public void Delete(ChuyenBay t) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "DELETE FROM chuyenbay WHERE id_chuyenbay = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaChuyenBay());
			st.executeUpdate();
			
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

	public static ArrayList<ChuyenBay> layQuaMaTuyenBay(String maTuyenBay) {
		ArrayList<ChuyenBay> chuyenBay = new ArrayList<ChuyenBay>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM chuyenbay JOIN tuyenbay ON chuyenbay.id_tuyenbay = tuyenbay.id_tuyenbay WHERE chuyenbay.id_tuyenbay = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,maTuyenBay);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String maChuyenBay = rs.getString("id_chuyenbay");
				String maMayBay = rs.getString("id_maybay");
				String diemDi = rs.getString("diemdi");
				String diemDen = rs.getString("diemden");
				String ngayBay = rs.getString("ngayBay");
				String gioBay = rs.getString("gioBay");
				int gia = rs.getInt("gia");
				
				ChuyenBay cb = new ChuyenBay(maChuyenBay, maMayBay, diemDi, diemDen, 
						Date.valueOf(ngayBay), Time.valueOf(gioBay), gia);
				chuyenBay.add(cb);
				
			}
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return chuyenBay;
	}

	public static void main(String[] args) {
		ChuyenBayDAO cbd = new ChuyenBayDAO();
		cbd.selectAll();
	}

	public static ArrayList<ChuyenBay> layQuaMaTuyenBayVaNgayDi(String maTuyenBay, String ngayDi) {
		ArrayList<ChuyenBay> chuyenBay = new ArrayList<ChuyenBay>();
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM chuyenbay JOIN tuyenbay ON chuyenbay.id_tuyenbay = tuyenbay.id_tuyenbay JOIN lichbay "
					+ "ON chuyenbay.id_lichbay = lichbay.id_lichbay "
					+ "WHERE chuyenbay.id_tuyenbay = ? AND chuyenbay.ngaybay = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1,maTuyenBay);
			st.setString(2, ngayDi);
			ResultSet rs = st.executeQuery();
			while(rs.next()) {
				String maChuyenBay = rs.getString("id_chuyenbay");
				String maMayBay = rs.getString("id_maybay");
				String diemDi = rs.getString("diemdi");
				String diemDen = rs.getString("diemden");
				String ngayBay = rs.getString("ngaybay");
				String gioBay = rs.getString("giobay");
				int gia = rs.getInt("gia");
				
				ChuyenBay cb = new ChuyenBay(maChuyenBay, maMayBay, diemDi, diemDen, 
						Date.valueOf(ngayBay), Time.valueOf(gioBay), gia);
				chuyenBay.add(cb);
				
			}
			
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		return chuyenBay;
	}
	

}
