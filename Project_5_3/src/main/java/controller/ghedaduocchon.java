package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.JDBCUtil;

/**
 * Servlet implementation class ghedaduocchon
 */
@WebServlet("/ghedaduocchon")
public class ghedaduocchon extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ghedaduocchon() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		try {
			Connection con = JDBCUtil.getConnection();
			String sql = "SELECT machuyenbaydi, machuyenbayve, maghedi, magheve FROM hanhkhach";
			PreparedStatement st = con.prepareStatement(sql);
			ResultSet rs = st.executeQuery();
			HashMap<String, ArrayList<String>> gheDaDuocMua = new HashMap<String, ArrayList<String>>();
			while(rs.next()) {
				String maChuyenBayDi = rs.getString("machuyenbaydi");
			    String maChuyenBayVe = rs.getString("machuyenbayve");
			    String maGheDi = rs.getString("maghedi");
			    String maGheVe = rs.getString("magheve");
			    if (gheDaDuocMua.containsKey(maChuyenBayDi)) {
			        gheDaDuocMua.get(maChuyenBayDi).add(maGheDi);
			    } else {
			        ArrayList<String> danhSachMaGhe = new ArrayList<>();
			        danhSachMaGhe.add(maGheDi);
			        gheDaDuocMua.put(maChuyenBayDi, danhSachMaGhe);
			    }
			    
			    if (gheDaDuocMua.containsKey(maChuyenBayVe)) {
			        gheDaDuocMua.get(maChuyenBayVe).add(maGheVe);
			    } else {
			        ArrayList<String> danhSachMaGhe = new ArrayList<>();
			        danhSachMaGhe.add(maGheVe);
			        gheDaDuocMua.put(maChuyenBayVe, danhSachMaGhe);
			    }
			}
			
			
	        response.setContentType("application/json");
	        PrintWriter out = response.getWriter();
	        out.print(gheDaDuocMua.toString());
	        out.close();
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
