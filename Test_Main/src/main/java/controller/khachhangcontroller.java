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

import database.ChuyenBayDAO;
import database.DichVuDAO;
import database.HanhKhachDAO;
import database.KhachHangDAO;
import database.TaiKhoanDAO;
import database.TuyenBayDAO;
import model.ChuyenBay;
import model.DichVu;
import model.HanhKhach;
import model.KhachHang;
import model.TaiKhoan;
import model.TuyenBay;

/**
 * Servlet implementation class khachhangcontroller
 */
@WebServlet("/khach-hang-controller")
public class khachhangcontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public khachhangcontroller() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		String hanhdong = request.getParameter("hanhDong");
		System.out.println(hanhdong);
		
		if(hanhdong.equals("dang-nhap")) {
			dangNhap(request, response);
		} else if(hanhdong.equals("chon-chuyen-bay")) {
			chonChuyenBay(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	// đăng nhập tài khoản 
	private void dangNhap(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String tenDangNhap = request.getParameter("tenDangNhap");
			String matKhau = request.getParameter("matKhau");
			
			TaiKhoan tk = new TaiKhoan();
			
			tk.setTenDangnhap(tenDangNhap);
			tk.setMatKhau(matKhau);
			TaiKhoanDAO tkd = new TaiKhoanDAO();
			KhachHangDAO khd = new KhachHangDAO();

			TaiKhoan taiKhoan = tkd.selectByUserNameAndPassword(tk);
			
			KhachHang khachHang =  khd.selectByMaTaiKhoan(taiKhoan.getMaTaiKhoan());
					
			String url = "";
			if(taiKhoan != null) {
				HttpSession session = request.getSession();
				session.setAttribute("taiKhoan", taiKhoan);
				session.setAttribute("khachHang", khachHang);
				url = "/thanhcong.jsp";
			} else {
				System.out.println("co lỗi r");
				request.setAttribute("baoLoi", "Co loi roi");
				url = "/dangnhap/jsp";
			}
													// chuyển hướng yêu cầu đến 1 tài nguyên khác (url)
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
			
		} catch (Exception e) {
			
		}
	}
	
	// đăng xuất => dùng chung
	private void dangXuat(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session =request.getSession();
			session.invalidate();
			String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath();
	
			response.sendRedirect(url + "/index.jsp");
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}
	
	// dăng ký 
	private void dangKy(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		try {
			
			// lấy thông tin từ request
			String tenDangNhap = request.getParameter("tenDangnhap");
			String matKhau = request.getParameter("matKhau");
			String matKhauNhapLai = request.getParameter("matKhauNhapLai");
			String hoVaTen = request.getParameter("hoVaTen");
			String ngaySinh = request.getParameter("ngaySinh");
			String soDienThoai = request.getParameter("soDienThoai");
			String email = request.getParameter("email");
			String diaChi = request.getParameter("diaChi");
			String gioiTinh = request.getParameter("gioiTinh");
			
			// giữ lại thông tin
			request.setAttribute("tenDangnhap", tenDangNhap);
			request.setAttribute("hoVaTen", hoVaTen);
			request.setAttribute("ngaySinh", ngaySinh);
			request.setAttribute("soDienThoai", soDienThoai);
			request.setAttribute("email", email);
			request.setAttribute("diaChi", diaChi);
			request.setAttribute("gioiTinh", gioiTinh);
			
			String baoLoi = "";
			String url = "";
			TaiKhoanDAO tkd = new TaiKhoanDAO();
			if(tkd.kiemTraTenDangNhap(tenDangNhap)) {
				baoLoi += "Tên đăng nhập đã tồn tại. Vui lòng thay đổi";
			}
			
			if(!matKhau.equals(matKhauNhapLai)) {
				baoLoi += "Mật khẩu không khớp";
			} 
			request.setAttribute("baoLoi", baoLoi);
			
			if(baoLoi.length()>0) {
				// về lại trang đăng ký
				url = "/dangky.jsp";
			} else {
				// chưa có thì thêm vào database
				String maTaiKhoan = "TKKH" + new Random().nextInt(10000) +"";
				String maKhachHang = "KH" + new Random().nextInt(10000) +"";
				boolean isGioiTinh = gioiTinh.equals("Nam")?true:false;
				KhachHang kh = new KhachHang(maKhachHang, maTaiKhoan, hoVaTen, Date.valueOf(ngaySinh), soDienThoai, email, diaChi, isGioiTinh );
				TaiKhoan tk = new TaiKhoan(maTaiKhoan, tenDangNhap, matKhau);
				KhachHangDAO .themKhachHang(kh, tk);
			}
	
		} catch(Exception e) {
			System.err.println(e.toString());
		}
	} 
	// thay đổi thông tin
	private void thayDoiThongTin(HttpServletRequest request, HttpServletResponse response) {
		try {
			String hoVaTen = request.getParameter("hoVaTen");
			String ngaySinh = request.getParameter("ngaySinh");
			String soDienThoai = request.getParameter("soDienThoai");
			String email = request.getParameter("email");
			String diaChi = request.getParameter("diaChi");
			String gioiTinh = request.getParameter("gioiTinh");
			
			// giữ lại thông tin
			request.setAttribute("hoVaTen", hoVaTen);
			request.setAttribute("ngaySinh", ngaySinh);
			request.setAttribute("soDienThoai", soDienThoai);
			request.setAttribute("email", email);
			request.setAttribute("diaChi", diaChi);
			request.setAttribute("gioiTinh", gioiTinh);
			
			String baoLoi = "";
			String url = "";
			
			request.setAttribute("baoLoi", baoLoi);
			
			if(baoLoi.length()>0) {
				url = "/thaydoithongtin";
			} else {
				HttpSession session =request.getSession();
				Object obj = session.getAttribute("khachHang");
				KhachHang khachHang = null;
				if(obj!=null) {
					khachHang = (KhachHang) obj;
					if(khachHang != null) {
						String maKhachHang = khachHang.getMaKhachHang();
						boolean isGioiTinh = gioiTinh == "Nam"?true:false;
						KhachHang kh = new KhachHang(maKhachHang, "", hoVaTen, Date.valueOf(ngaySinh), soDienThoai, email, diaChi, isGioiTinh);
						KhachHangDAO.capNhatThongTin(kh);
						KhachHang kh2 = KhachHangDAO.selectByMaKhachHang(kh);
						request.getSession().setAttribute("khachHang", kh2);
					}
				}
			}
			RequestDispatcher rs = getServletContext().getRequestDispatcher(url);
			rs.forward(request, response);
			
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}
	
	// đổi mật khẩu
	private void doiMatKhau(HttpServletRequest request, HttpServletResponse response) {
		try {
			String matKhauHienTai = request.getParameter("matKhauHienTai");
			String matKhauMoi = request.getParameter("matKhaumoi");
			String matKhauNhapLai = request.getParameter("matKhauNhapLai");
			
			String baoLoi = "";
			String url = "";
			HttpSession session = request.getSession();
			Object obj = session.getAttribute("taiKhoan");
			TaiKhoan taiKhoan =  null;
			if(obj!=null) {
				taiKhoan = (TaiKhoan) obj;
				if(taiKhoan == null) {
					baoLoi = "Bạn chưa đăng nhập";
					url = "/doimatkhau.jsp";
				} else {
					if(!matKhauHienTai.equals(taiKhoan.getMatKhau())) {
						baoLoi = "Mật khẩu hiện tại không chính xác";
						url = "/doimatkhau.jsp";
					} else {
						if(!matKhauMoi.equals(matKhauNhapLai)) {
							baoLoi = "Mật khẩu nhập lại không chính xác";
							url = "/doimatkhau.jsp";
						} else {
							TaiKhoanDAO tkd = new TaiKhoanDAO();
							taiKhoan.setMatKhau(matKhauMoi);
							tkd.thayDoiMatKhau(taiKhoan);
							baoLoi = "Thay đổi thành công";
							url = "/doimatkhau.jsp";
						}
					}
				}
			}
			
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}
	
	// chọn chuyến bay
	private void chonChuyenBay(HttpServletRequest request, HttpServletResponse response) {
		try {
			String diemDi = request.getParameter("diemDi");
			String diemDen = request.getParameter("diemDen");
			System.out.println(diemDi + "   " + diemDen);
			String ngayDi = request.getParameter("ngayDi");
			System.out.println(ngayDi);
			
			TuyenBay tuyenBay = TuyenBayDAO.layQuaDiemDiVaDen(diemDi, diemDen);
			
			System.out.println(tuyenBay.toString());
			
			ArrayList<ChuyenBay> chuyenBay = ChuyenBayDAO.layQuaMaTuyenBayVaNgayDi(tuyenBay.getMaTuyenBay(), ngayDi);
			
			for(ChuyenBay cb : chuyenBay) {
				System.out.println(cb.toString());
			}
			
			HttpSession session = request.getSession();
			session.setAttribute("danhSachChuyenBay", chuyenBay);
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/datve.jsp");
			rd.forward(request, response);
			
		} catch (Exception e) {
			System.err.println(e.toString());
		}
		
	}
	
	// điền thông tin hành khách
	private void datVeMayBay(HttpServletRequest request, HttpServletResponse response) {
		try  {
			String hoVaTen = request.getParameter("hoVaTen");
			String ngaySinh = request.getParameter("ngaySinh");
			String email = request.getParameter("email");
			String soDienThoai = request.getParameter("soDienThoai");
			String gioiTinh = request.getParameter("gioiTinh");
			String diaChi = request.getParameter("diaChi");
			String soCCCD = request.getParameter("soCCCD");
			String quocTich = request.getParameter("quocTich");
			
			boolean isGioiTinh = gioiTinh == "Nam" ? true:false;
			String maHanhKhach = "HK" + new  Random().nextInt(10000);
			
			HanhKhach hanhKhach = new HanhKhach(maHanhKhach, hoVaTen, Date.valueOf(ngaySinh), email, soDienThoai, diaChi, isGioiTinh,  soCCCD, quocTich);
			HanhKhachDAO.themHanhKhach(hanhKhach);
			
			HttpSession session = request.getSession();
			session.setAttribute("hanhKhach", hanhKhach);
		} catch (Exception e) {
			
		}
	}
	
	
	// chọn dịch vụ đi kèm 
	private void chonDichVu(HttpServletRequest request, HttpServletResponse response) {
		try {
			String khauPhanAn = request.getParameter("khauPhanAn");
			String khoiLuongHanhLy = request.getParameter("khoiLuongHanhLy");
			
			DichVu dichVu = DichVuDAO.layQuaKPAVaKLHL(khauPhanAn, khoiLuongHanhLy);
			HttpSession session = request.getSession();
			session.setAttribute("dichVu", dichVu);
			
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}
	
	// xuất hóa đơn 
	
	// thanh toán 
	
	// yêu cầu hỗ trợ 
	
	// quản lý giỏ hàng 

}
