package controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
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
import model.*;
import database.*;

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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		String hanhdong = request.getParameter("hanhDong");
		if(hanhdong.equals("ql-chuyen-bay")) {
			qlChuyenBay(request, response);
		} else if(hanhdong.equals("ql-ve-may-bay")) {
			qlVeMayBay(request, response);
		} else if(hanhdong.equals("cham-soc-khach-hang")) {
			chamSocKhachHang(request, response);
		} else if(hanhdong.equals("thong-ke-doanh-thu")) {
			thongKeDoanhThu(request, response);
		} else if(hanhdong.equals("dang-xuat")) {
			dangXuat(request, response);
		} else if (hanhdong.equals("dang-nhap")) {
			dangNhap(request, response);
		} else if (hanhdong.equals("thong-bao")) {
			thongBao(request, response);
		} else if (hanhdong.equals("trang-chu")) {
			trangChu(request, response);
		} else if (hanhdong.equals("xoa-chuyen")) {
			xoaChuyen(request, response);
		} else if (hanhdong.equals("tim-kiem-cb")) {
			timKiemChuyenBayStaff(request, response);
		}
	}

	private void timKiemChuyenBayStaff(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Tim kiem chuyen bay Staff");
		try {
			String maChuyenBay = request.getParameter("input__machyen");
			String ThoiGian = (String) request.getParameter("input_thoigian");
			
			System.out.println("Ma chuyen bay: " + maChuyenBay);
			System.out.println("Thoi gian: " + ThoiGian);
			
			ChuyenBayDAO cbd = new ChuyenBayDAO();
			ArrayList<ChuyenBay> allChuyenBay = cbd.timKiemChuyenBay(maChuyenBay, ThoiGian);
			if (allChuyenBay == null || allChuyenBay.size() == 0) {
				System.out.println("chuyen bay null");
			} else {
				System.out.println("chuyen bay not null");
			}
			HttpSession session = request.getSession();
			session.setAttribute("allChuyenBay", allChuyenBay);
			
			String url = "/staff/flights.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			System.out.println("Vua out controller tim kiem chuyen bay ne");
			rd.forward(request, response);
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}

	private void xoaChuyen(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Xoa chuyen bay");
		try {
			String maChuyenBayXoa = (String) request.getParameter("maChuyenBayXoa");
			if (maChuyenBayXoa == null) {
				System.out.println("Ma chuyen bay xoa null");
			} else {
				System.out.println("Ma chuyen bay xoa not null" + maChuyenBayXoa);
			}
			ChuyenBay chuyenBayXoa1 = new ChuyenBayDAO().selectByID(maChuyenBayXoa);
			if (chuyenBayXoa1 == null) {
				System.out.println("Chuyen bay xoa null");
			} else {
				System.out.println("Chuyen bay xoa not null" + chuyenBayXoa1.getMaChuyenBay());
			}
			ChuyenBayDAO cbd = new ChuyenBayDAO();
			cbd.Delete(chuyenBayXoa1);
			System.out.println("Xoa chuyen bay thanh cong");
			qlChuyenBay(request, response);
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}

	private void trangChu(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			response.setContentType("text/html;charset=UTF-8");
			
			String url = "/staff/staff.jsp";
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
        } catch (Exception e) {
            System.err.println(e.toString());
        }
	}

	private void dangXuat(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			session.removeAttribute("auth");
			session.invalidate();
			String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/index.jsp";
			response.sendRedirect(url);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void thongKeDoanhThu(HttpServletRequest request, HttpServletResponse response)  {
		try {
			HttpSession session = request.getSession();
			response.setContentType("text/html;charset=UTF-8");
			
			String url = "/staff/revenue.jsp";
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}

	private void qlVeMayBay(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			
			String url = "/staff/airline-tickets.jsp";
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}

	private void qlChuyenBay(HttpServletRequest request, HttpServletResponse response) {
		try {
			System.out.println("chuyen bay moi vao controller");
			
			ArrayList<ChuyenBay> allChuyenBay = new ChuyenBayDAO().selectAll();
			if (allChuyenBay == null) {
				System.out.println("chuyen bay null");
			} else {
				System.out.println("chuyen bay not null");
			}
			HttpSession session = request.getSession();
			session.setAttribute("allChuyenBay", allChuyenBay);
			
			String url = "/staff/flights.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			System.out.println("Vua out controller ne");
			rd.forward(request, response);
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		
	}

	private void chamSocKhachHang(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			response.setContentType("text/html;charset=UTF-8");

			String url = "/staff/customer-care.jsp";

			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		
	}
	
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
			
			
			tk.setTenDangNhap(tenDangNhap);
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
