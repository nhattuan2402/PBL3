package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.NhanVienDAO;
import database.TaiKhoanDAO;
import database.ThongBaoDao;
import model.NhanVien;
import model.TaiKhoan;
import model.ThongBao;

/**
 * Servlet implementation class nhanviencontroller
 */
@WebServlet("/nhan-vien-controller")
public class nhanviencontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public nhanviencontroller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	// đăng nhập
	private void dangNhap(HttpServletRequest request, HttpServletResponse response)  {
		try {
			String tenDangNhap = request.getParameter("tenDangnhap");
			String matKhau = request.getParameter("matKhau");
			
			TaiKhoan tk = new TaiKhoan();
			
			
			tk.setTenDangnhap(tenDangNhap);
			tk.setMaTaiKhoan(matKhau);
			TaiKhoanDAO tkd = new TaiKhoanDAO();
			NhanVienDAO nvd = new NhanVienDAO();
			
			TaiKhoan taiKhoan = tkd.selectByUserNameAndPassword(tk);
			NhanVien nhanVien =  nvd.selectByMaTaiKhoan(taiKhoan.getMaTaiKhoan());
					
			String url = "";
			if(taiKhoan != null) {
				HttpSession session = request.getSession();
				session.setAttribute("taiKhoan", taiKhoan);
				session.setAttribute("nhanVien", nhanVien);
				url = "/index.jsp";
			} else {
				request.setAttribute("baoLoi", "Co loi roi");
				url = "/dangnhap/jsp";
			}
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
			
		} catch (ServletException e) {
			System.err.println(e.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	// đăng thông báo 
	private void thongBao(HttpServletRequest request, HttpServletResponse response) {
		try {
			String tenThongBao = request.getParameter("tenThongbao");
			Date thoiGian = new Date(System.currentTimeMillis());
			String noiDung = request.getParameter("noiDung");
			
			request.setAttribute("tenThongBao", tenThongBao);
			request.setAttribute("noiDung", noiDung);
			
			String maThongBao = "THB" + new Random().nextInt(1000);
			ThongBao tb = new ThongBao(maThongBao, tenThongBao, thoiGian, noiDung);
			ThongBaoDao tbd = new ThongBaoDao();
			tbd.themThongBao(tb);
			
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}
	// quản lý chuyến bay
	
	// thống kê
	
}
