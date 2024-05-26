package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.HanhKhach;

/**
 * Servlet implementation class dienthongtin
 */
@WebServlet("/dien-thong-tin")
public class dienthongtin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dienthongtin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		try  {
			HttpSession session = request.getSession();
			int soNguoiLon = Integer.parseInt(session.getAttribute("soNguoiLon").toString());
			int soTreEm = Integer.parseInt(session.getAttribute("soTreEm").toString());
			int soHK = soNguoiLon + soTreEm;
			System.out.println(soHK);
			String loaiVe = session.getAttribute("loaiVe").toString();
			
			
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			out.println("{\"loaiVe\": \"" + loaiVe + "\", \"soHK\": \"" + soHK + "\"}");
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
