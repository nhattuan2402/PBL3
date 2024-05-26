package controller;

import java.io.IOException;
import java.sql.Date;
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
import util.MaHoaMatKhau;
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
		} else if (hanhdong.equals("them-nhan-vien")) {
			themNhanVien(request, response);
		} else if (hanhdong.equals("tim-kiem-nhanvien")) {
			timKiemNhanVien(request, response);
		} else if (hanhdong.equals("tim-kiem-khachhang")) {
			timKiemKhachHang(request, response);
		}
	}

	private void timKiemKhachHang(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("vào tìm kiếm khách hàng");
		try {
			String sapxep = request.getParameter("sapxep-staff");
			String input_text = request.getParameter("input_search-staff");

			System.out.println("input_text: " + input_text);
			System.out.println("sapxep: " + sapxep);

			KhachHangDAO khachHangDAO = new KhachHangDAO();
			ArrayList<KhachHang> allKhachHang = khachHangDAO.timKiemKhachHang(sapxep, input_text);

			if (allKhachHang == null) {
				System.out.println("Không có khách hàng nào");
			} else {
				System.out.println("Có " + allKhachHang.size() + " khách hàng");
			}

			HttpSession session = request.getSession();
			session.setAttribute("allKhachHang", allKhachHang);

			String url = "/admin/customer-account.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void timKiemNhanVien(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("vào tìm kiếm nhân viên");
		try {
			String sapxep = request.getParameter("sapxep-staff");
			String input_text = request.getParameter("input_search-staff");
			
			System.out.println("input_text: " + input_text);
			System.out.println("sapxep: " + sapxep);

			NhanVienDAO nhanVienDAO = new NhanVienDAO();
			ArrayList<NhanVien> allNhanVien = nhanVienDAO.timKiemNhanVien(sapxep, input_text);
			
			if (allNhanVien == null) {
				System.out.println("Không có nhân viên nào");
			} else {
				System.out.println("Có " + allNhanVien.size() + " nhân viên");
			}

			HttpSession session = request.getSession();
			session.setAttribute("allNhanVien", allNhanVien);

			String url = "/admin/staff-account.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void themNhanVien(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		System.out.println("vào thêm nhân viên");
		try {
			String newTenNhanVien = request.getParameter("new-name");
			String newNgaySinh = (String) request.getParameter("new-birth");
			String newGioiTinh = request.getParameter("new-gender");
			String newDiaChi = request.getParameter("new-address");
			String newSoDienThoai = request.getParameter("new-phone");
			String newEmail = request.getParameter("new-email");
			String newMatKhau = request.getParameter("new-password");
			String newChucVu = "nhanvien";
			
			System.out.println("newTenNhanVien: " + newTenNhanVien);
			System.out.println("newNgaySinh: " + newNgaySinh);
			System.out.println("newGioiTinh: " + newGioiTinh);
			System.out.println("newDiaChi: " + newDiaChi);
			System.out.println("newSoDienThoai: " + newSoDienThoai);
			System.out.println("newEmail: " + newEmail);
			System.out.println("newMatKhau: " + newMatKhau);
			System.out.println("newChucVu: " + newChucVu);
			
			String url = "/admin/staff-account.jsp";
			String error = "";

			TaiKhoanDAO taiKhoanDAO = new TaiKhoanDAO();
			if (taiKhoanDAO.kiemTraTenDangNhap(newEmail)) {
				System.out.println("Tên đăng nhập đã tồn tại");
				error = "Tên đăng nhập đã tồn tại";
			} else {
				String maxMaTaiKhoan = taiKhoanDAO.getMaxMaTaiKhoan();
				System.out.println("maxMaTaiKhoan: " + maxMaTaiKhoan);
				String nextMaTaiKhoan = getNextMaTaiKhoan(maxMaTaiKhoan);
				System.out.println("nextMaTaiKhoan: " + nextMaTaiKhoan);
				TaiKhoan taiKhoan = new TaiKhoan(nextMaTaiKhoan, newEmail, MaHoaMatKhau.toSHA1(newMatKhau), newChucVu);
				taiKhoanDAO.themTaiKhoan(taiKhoan);

				NhanVienDAO nhanVienDAO = new NhanVienDAO();
				String maxMaNhanVien = nhanVienDAO.getMaxMaNhanVien();
				System.out.println("maxMaNhanVien: " + maxMaNhanVien);
				String nextMaNhanVien = getNextMaNhanVien(maxMaNhanVien);
				System.out.println("nextMaNhanVien: " + nextMaNhanVien);
				Date ngaySinh = Date.valueOf(newNgaySinh);
				NhanVien nhanVien = new NhanVien(nextMaNhanVien, nextMaTaiKhoan, newTenNhanVien, ngaySinh, newSoDienThoai,
						newEmail, newDiaChi, newGioiTinh.equals("1"));
				NhanVienDAO.themNhanVien(nhanVien, taiKhoan);

				System.out.println("Thêm nhân viên thành công");
			}

			System.out.println("Thêm nhân viên thành công");
		} catch (Exception e) {
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		response.setContentType("text/html;charset=UTF-8");
		quanLyNhanVien(request, response);
	}

	private String getNextMaNhanVien(String maxMaNhanVien) {
		if (maxMaNhanVien == null || maxMaNhanVien.isEmpty()) {
			return "NV1";
		}
		String numericPart = maxMaNhanVien.substring(2);
		int number = Integer.parseInt(numericPart);
		number++;
		return "NV" + number;
	}

	private String getNextMaTaiKhoan(String maxMaTaiKhoan) {
		if (maxMaTaiKhoan == null || maxMaTaiKhoan.isEmpty()) {
			return "TKNV1";
		}
		String numericPart = maxMaTaiKhoan.substring(4);
		int number = Integer.parseInt(numericPart);
		number++;
		return "TKNV" + number;
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
			ArrayList<MayBay> allMayBay = new MayBayDAO().selectAll();
			if(allMayBay==null) {
				allMayBay = new ArrayList<MayBay>();
			}
			session.setAttribute("allMayBay", allMayBay);
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
			
			ArrayList<KhachHang> allKhachHang = new KhachHangDAO().selectAll();
			
			if (allKhachHang == null) {
				System.out.println("Không có khách hàng nào");
			} else {
				System.out.println("Có " + allKhachHang.size() + " khách hàng");
			}
			
			session.setAttribute("allKhachHang", allKhachHang);
			
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
			
			HoaDonDAO hoaDonDAO = new HoaDonDAO();
			ArrayList<HoaDon> allHoaDon = hoaDonDAO.selectAll();
			
			String url = "/admin/revenue.jsp";
			
			session.setAttribute("allHoaDon", allHoaDon);
			
			if (allHoaDon == null) {
				System.out.println("Không có hóa đơn nào");
			} else {
				System.out.println("Có " + allHoaDon.size() + " hóa đơn");
			}
			
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

}
