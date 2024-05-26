package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.TuyenBayDAO;

/**
 * Servlet implementation class laythanhpho
 */
@WebServlet("/laythanhpho")
public class laythanhpho extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public laythanhpho() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String[] vietnamCities = layThanhPho();
		
        // Chuyển đổi mảng thành phố thành chuỗi JSON và gửi về client
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        out.print("[\"" + String.join("\",\"", vietnamCities) + "\"]");
        out.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	private String[] layThanhPho() {
	        ArrayList<String> cities = TuyenBayDAO.layThanhPho();
	        return cities.toArray(new String[0]);
	}
}