package controller;

import java.io.IOException;
import java.sql.Time;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import database.*;

/**
 * Servlet implementation class admincontroller
 */
@WebServlet("/admin-controller")
public class admincontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public admincontroller() {
        
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		String hanhdong = request.getParameter("hanhDong");
		if(hanhdong.equals("trang-chu")) {
			trangChu(request, response);
		} else if (hanhdong.equals("ql-tuyen-bay")) {
			quanLyTuyenBay(request, response);
		} else if (hanhdong.equals("ql-lich-bay")) {
			quanLyLichBay(request, response);
		} else if (hanhdong.equals("ql-may-bay")) {
			quanLyMayBay(request, response);
		} else if (hanhdong.equals("ql-nhan-vien")) {
			quanLyNhanVien(request, response);
		} else if (hanhdong.equals("ql-khach-hang")) {
			quanLyKhachHang(request, response);
		} else if (hanhdong.equals("thong-ke-doanh-thu")) {
			thongKeDoanhThu(request, response);
		} else if (hanhdong.equals("dang-xuat")) {
			dangXuat(request, response);
		} else if (hanhdong.equals("them-tuyen-bay")) {
			themTuyenBay(request, response);
		} else if (hanhdong.equals("tim-kiem-tuyen")) {
			timKiemTuyen(request, response);
		} else if (hanhdong.equals("them-lich-bay")) {
			themLichBay(request, response);
		} else if (hanhdong.equals("tim-kiem-lich-bay")) {
			timKiemLichBay(request, response);
		}
	}

	private void timKiemLichBay(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("vào tìm kiếm lịch bay");
		try {
			String sapxep = request.getParameter("sapxep-lich");
			
			if (sapxep.equals("1")) {
				sapxep = "ASC";
			} else {
				sapxep = "DESC";
			}

			System.out.println("sapxep: " + sapxep);
			
			LichBayDAO lichBayDAO = new LichBayDAO();
			ArrayList<LichBay> allLichBay = lichBayDAO.timKiemLichBay(sapxep);
			
			HttpSession session = request.getSession();
			session.setAttribute("allLichBay", allLichBay);
			
			String url = "/admin/flight-schedules.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void themLichBay(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("vào thêm lịch bay");
		try {
			String newLichBay = (String)request.getParameter("new-lich-bay");
			System.out.println("newMaTuyenBay: " + newLichBay);

			LichBayDAO lichBayDAO = new LichBayDAO();
			String maxMaLichBay = lichBayDAO.getMaxMaLichBay();

			System.out.println("maxMaLichBay: " + maxMaLichBay);

			String nextMaLichBay = getNextMaLichBay(maxMaLichBay);

			System.out.println("nextMaLichBay: " + nextMaLichBay);
			
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
	        LocalTime localTime = LocalTime.parse(newLichBay, formatter);
	        Time thoiGianCatCanh = Time.valueOf(localTime);

			LichBay lichBay = new LichBay(nextMaLichBay, thoiGianCatCanh);
			lichBayDAO.Add(lichBay);

			System.out.println("Thêm lịch bay thành công");
		} catch (Exception e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		quanLyLichBay(request, response);
	}
	private String getNextMaLichBay(String maxMaLichBay) {
		if (maxMaLichBay == null || maxMaLichBay.isEmpty()) {
			return "LB001";
		}
		String numericPart = maxMaLichBay.substring(2);
		int number = Integer.parseInt(numericPart);
		number++;
		return "LB" + number;
	}

	private void timKiemTuyen(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("vào tìm kiếm tuyến bay");
		try {
			String chuyenDi = request.getParameter("input__diemdi-new");
			String chuyenVe = request.getParameter("input__diemden-new");
			
			System.out.println("chuyenDi: " + chuyenDi);
			System.out.println("chuyenVe: " + chuyenVe);
			
			TuyenBayDAO tuyenBayDAO = new TuyenBayDAO();
			ArrayList<TuyenBay> allTuyenBay = tuyenBayDAO.timKiemTuyenBay(chuyenDi, chuyenVe);
			
			if (allTuyenBay == null) {
				System.out.println("Không có tuyến bay nào");
			} else {
				System.out.println("Có " + allTuyenBay.size() + " tuyến bay");
			}
			HttpSession session = request.getSession();
			session.setAttribute("allTuyenBay", allTuyenBay);
			
			String url = "/admin/flight-route.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
		    rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void themTuyenBay(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("vào thêm tuyến bay");
		try {
			String newChuyenDi = request.getParameter("new-chuyenDi");
			String newChuyenDen = request.getParameter("new-chuyenDen");
			String newThoiGianBay = request.getParameter("new-GiaMoi");
			
			TuyenBayDAO tuyenBayDAO = new TuyenBayDAO();
			String maxMaTuyenBay = tuyenBayDAO.getMaxMaTuyenBay();
			
			System.out.println("maxMaTuyenBay: " + maxMaTuyenBay);
			
			String nextMaTuyenBay = getNextMaTuyenBay(maxMaTuyenBay);
			
			System.out.println("nextMaTuyenBay: " + nextMaTuyenBay);
			
			TuyenBay tuyenBay = new TuyenBay(nextMaTuyenBay, newChuyenDi, newChuyenDen, Double.parseDouble(newThoiGianBay));
			tuyenBayDAO.Add(tuyenBay);
			
			System.out.println("Thêm tuyến bay thành công");
		} catch (Exception e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		quanLyTuyenBay(request, response);
	}

	private String getNextMaTuyenBay(String maxMaTuyenBay) {
		if (maxMaTuyenBay == null || maxMaTuyenBay.isEmpty()) {
			return "TB001";
		}
		String numericPart = maxMaTuyenBay.substring(2);
		int number = Integer.parseInt(numericPart);
		number++;
		return "TB" + number;
	}

	private void dangXuat(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession();
			session.removeAttribute("admin");
			session.invalidate();
			String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/index.jsp";
			response.sendRedirect(url);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	private void trangChu(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession();
			response.setContentType("text/html;charset=UTF-8");
			
			String url = "/admin/admin.jsp";
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
        } catch (Exception e) {
            System.err.println(e.toString());
        }
	}

	private void quanLyTuyenBay(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			System.out.println("vào quan ly tuyen bay");
			HttpSession session = request.getSession();
			response.setContentType("text/html;charset=UTF-8");
			
			ArrayList<TuyenBay> allTuyenBay = new TuyenBayDAO().selectAll();
			if (allTuyenBay == null) {
				System.out.println("Không có tuyến bay nào");
			} else {
				System.out.println("Có " + allTuyenBay.size() + " tuyến bay");
			}
			session.setAttribute("allTuyenBay", allTuyenBay);
			
			String url = "/admin/flight-route.jsp";
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
        } catch (Exception e) {
            System.err.println(e.toString());
        }
	}

	private void quanLyLichBay(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			System.out.println("vào quan ly lich bay");
			HttpSession session = request.getSession();
			response.setContentType("text/html;charset=UTF-8");
			
			ArrayList<LichBay> allLichBay = new LichBayDAO().selectAll();
			if (allLichBay == null) {
				System.out.println("Không có lịch bay nào");
				allLichBay = new ArrayList<LichBay>();
			} else {
				System.out.println("Có " + allLichBay.size() + " lịch bay");
			}
			
			session.setAttribute("allLichBay", allLichBay);
			
			String url = "/admin/flight-schedules.jsp";
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
        } catch (Exception e) {
            System.err.println(e.toString());
        }
	}

	private void quanLyMayBay(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession();
			response.setContentType("text/html;charset=UTF-8");
			
			String url = "/admin/plane.jsp";
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
        } catch (Exception e) {
            System.err.println(e.toString());
        }
	}

	private void quanLyNhanVien(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			System.out.println("vào quan ly nhan vien");
			HttpSession session = request.getSession();
			response.setContentType("text/html;charset=UTF-8");
			
			ArrayList<NhanVien> allNhanVien = new NhanVienDAO().selectAll();
			
			if (allNhanVien == null) {
				System.out.println("Không có nhân viên nào");
			} else {
				System.out.println("Có " + allNhanVien.size() + " nhân viên");
			}

			session.setAttribute("allNhanVien", allNhanVien);
			
			String url = "/admin/staff-account.jsp";
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
        } catch (Exception e) {
            System.err.println(e.toString());
        }
	}

	private void quanLyKhachHang(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession();
			response.setContentType("text/html;charset=UTF-8");
			
			String url = "/admin/customer-account.jsp";
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
        } catch (Exception e) {
            System.err.println(e.toString());
        }
	}

	private void thongKeDoanhThu(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		try {
			HttpSession session = request.getSession();
			response.setContentType("text/html;charset=UTF-8");
			
			String url = "/admin/revenue.jsp";
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
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
	
	
	// quản lý tài khoản
	
	// quản lý tuyến bay
	
	// quản ký lịch bay
	
	// quản lý máy bay

}
