package database;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
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
		ChuyenBay cb = null;
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM chuyenbay WHERE id_chuyenbay = ?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaChuyenBay());
			ResultSet rs = st.executeQuery();
			
			while(rs.next()) {
				String maChuyenBay = rs.getString("id_chuyenbay");
				String maMayBay = rs.getString("id_maybay");
				String maLichBay = rs.getString("id_lichbay");
				String maTuyenBay = rs.getString("id_tuyenbay");
				Date ngayBay = rs.getDate("ngaybay");
				
				cb = new ChuyenBay(maChuyenBay, maMayBay, maLichBay,maTuyenBay, ngayBay);
				break;
			}
			
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cb;
	}

	@Override
	public void Add(ChuyenBay t) {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "INSERT INTO chuyenbay (id_chuyenbay, id_maybay, id_lichbay, id_tuyenbay, ngaybay) VALUES (?,?,?,?,?)";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaChuyenBay());
//			st.setString(2, t.getMaNhanVien());
			st.setString(2, t.getMaMayBay());
			st.setString(3,  t.getMaLichBay());
			st.setString(4, t.getMaTuyenBay());
			st.setDate(5, t.getNgayBay());
			st.executeUpdate();
			
			JDBCUtil.closeConnection(con);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void Update(ChuyenBay t) {
	    try {
	        Connection con = JDBCUtil.getConnection();
	        String sql = "UPDATE chuyenbay SET id_maybay = ?, id_lichbay = ?,id_tuyenbay = ?, ngaybay = ? WHERE id_chuyenbay = ?";
	        PreparedStatement st = con.prepareStatement(sql);
//	        st.setString(1, t.getMaNhanVien());
	        st.setString(1, t.getMaMayBay());
	        st.setString(2, t.getMaLichBay());
	        st.setString(3, t.getMaTuyenBay());
	        st.setDate(4, t.getNgayBay());
	        st.setString(5, t.getMaChuyenBay());

	        st.executeUpdate();
	        JDBCUtil.closeConnection(con);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
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
	
	public static void main(String[] args) {
		ChuyenBayDAO cbd = new ChuyenBayDAO();
		ChuyenBay cb = new ChuyenBay("CB3","MB3","LB3","TB3",new Date(2024-1900, 05-1,25));
		cbd.Delete(cb);
	}

}
