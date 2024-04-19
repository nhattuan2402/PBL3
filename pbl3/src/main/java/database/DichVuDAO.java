package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import model.DichVu;

public class DichVuDAO implements DAOInterface<DichVu> {

	@Override
	public ArrayList<DichVu> selectAll() {
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT * FROM dichvu";

			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();

			ResultSetMetaData rsmd = rs.getMetaData();
			int socot = rsmd.getColumnCount();

			for (int i = 1; i <= socot; i++) {
				System.out.print(rsmd.getColumnLabel(i) + "   ");
			}
			while (rs.next()) {
				for (int i = 1; i <= socot; i++) {
					System.out.println(rs.getObject(i) + "  ");
				}
				System.out.println("\n");
				rs.close();
				JDBCUtil.closeConnection(con);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public DichVu selectByID(DichVu t) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void Add(DichVu t) {
		// TODO Auto-generated method stub

	}

	@Override
	public void Update(DichVu t) {
		// TODO Auto-generated method stub

	}

	@Override
	public void Delete(DichVu t) {
		// TODO Auto-generated method stub

	}
	
	public static void main(String[] args) {
		DichVuDAO dvd = new DichVuDAO();
		dvd.selectAll();
	}

}
