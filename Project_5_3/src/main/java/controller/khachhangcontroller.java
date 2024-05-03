package controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;
import java.time.LocalTime;
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
import database.HoTroDAO;
import database.KhachHangDAO;
import database.NhanVienDAO;
import database.TaiKhoanDAO;
import database.TuyenBayDAO;
import model.ChuyenBay;
import model.DichVu;
import model.HanhKhach;
import model.HoTro;
import model.KhachHang;
import model.NhanVien;
import model.TaiKhoan;
import model.TuyenBay;
import util.MaHoaMatKhau;

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
		if(hanhdong.equals("dang-nhap")) {
			dangNhap(request, response);
		} else if(hanhdong.equals("dang-ky")) {
			dangKy(request, response);
		} else if(hanhdong.equals("tim-kiem-chuyen-bay")) {
			timChuyenBay(request, response);
		} else if(hanhdong.equals("yeu-cau-ho-tro")) {
			yeuCauHoTro(request, response);
		} else if(hanhdong.equals("loc-chuyen-bay")) {
			locChuyenBay(request, response);
		} else if(hanhdong.equals("dang-xuat")) {
			dangXuat(request, response);
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
	private void dangNhap(HttpServletRequest request, HttpServletResponse response) {
		try {
			String tenDangNhap = request.getParameter("signin__memberEmail");
			String matKhau = request.getParameter("signin__memberpassword");
			String matKhauMaHoa = MaHoaMatKhau.toSHA1(matKhau);
			System.out.println(tenDangNhap+" " + matKhau);
			TaiKhoan tk = new TaiKhoan();
			
			tk.setTenDangNhap(tenDangNhap);
			tk.setMatKhau(matKhauMaHoa);
			
			TaiKhoanDAO tkd = new TaiKhoanDAO();
			TaiKhoan taiKhoan = tkd.selectByUserNameAndPassword(tk);
			HttpSession session = request.getSession();
			String currentPage = (String) session.getAttribute("trangHienTai");
            
			String url = "";
			
			if(taiKhoan != null) {
				if(taiKhoan.getRole().equals("khachhang")) {
					KhachHangDAO khd = new KhachHangDAO();
					KhachHang khachHang =  khd.selectByMaTaiKhoan(taiKhoan.getMaTaiKhoan());
					session = request.getSession();
					session.setAttribute("taiKhoan", taiKhoan);
					session.setAttribute("khachHang", khachHang);
					url = "/" + currentPage;
				} else {
					NhanVienDAO nvd = new NhanVienDAO();
					NhanVien nhanVien = nvd.selectByMaTaiKhoan(taiKhoan.getMaTaiKhoan());
					session = request.getSession();
					session.setAttribute("taiKhoan", taiKhoan);
					session.setAttribute("nhanVien", nhanVien);
					url = "/nhanvien.jsp";
				}
			} else {
				request.setAttribute("baoLoiDangNhap", "Email hoặc mật khẩu không chính xác");
				url = "/" +currentPage;
			}
			// chuyển hướng yêu cầu đến 1 tài nguyên khác (url)
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
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
	private void dangKy(HttpServletRequest request, HttpServletResponse response){
		try {
			// lấy thông tin từ request
			String hoVaTen = request.getParameter("fullName");
			String ngaySinh = request.getParameter("dateOfBirth");
			String soDienThoai = request.getParameter("mobileNumber");
			String email = request.getParameter("memberEmailSignUp");
			String diaChi = request.getParameter("companyCity");
			String gioiTinh = request.getParameter("gender");
			String matKhau = request.getParameter("memberpassword");
			
			// giữ lại thông tin
			request.setAttribute("hoVaTen", hoVaTen);
			request.setAttribute("ngaySinh", ngaySinh);
			request.setAttribute("soDienThoai", soDienThoai);
			request.setAttribute("email", email);
			request.setAttribute("diaChi", diaChi);
			request.setAttribute("gioiTinh", gioiTinh);
			
			String baoLoi = "";
			String url = "";
			TaiKhoanDAO tkd = new TaiKhoanDAO();
			if(tkd.kiemTraTenDangNhap(email)) {
				baoLoi += "Email đã được đăng ký. Vui lòng thay đổi";
				url = "/index.jsp";
			}

			request.setAttribute("baoLoiDangKy", baoLoi);
			
			if(baoLoi.length()>0) {
				url = "/index.jsp";
			} else {
				// chưa có thì thêm vào database
				String maTaiKhoan = "TKKH" + new Random().nextInt(10000) +"";
				String maKhachHang = "KH" + new Random().nextInt(10000) +"";
				boolean isGioiTinh = gioiTinh.equals("1")?true:false;
				KhachHang kh = new KhachHang(maKhachHang, maTaiKhoan, hoVaTen, Date.valueOf(ngaySinh), soDienThoai, email, diaChi, isGioiTinh );
				TaiKhoan tk = new TaiKhoan(maTaiKhoan, email, MaHoaMatKhau.toSHA1(matKhau), "khachhang");
				KhachHangDAO.themKhachHang(kh, tk);
				url = "/index.jsp";
			}
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
			
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
				if(taiKhoan == null){
					baoLoi = "Bạn chưa đăng nhập";
					url = "/doimatkhau.jsp";
				} else {
					if(!MaHoaMatKhau.toSHA1(matKhauHienTai).equals(taiKhoan.getMatKhau())) {
						baoLoi = "Mật khẩu hiện tại không chính xác";
						url = "/doimatkhau.jsp";
					} else {
						if(!matKhauMoi.equals(matKhauNhapLai)) {
							baoLoi = "Mật khẩu nhập lại không chính xác";
							url = "/doimatkhau.jsp";
						} else {
							TaiKhoanDAO tkd = new TaiKhoanDAO();
							taiKhoan.setMatKhau(MaHoaMatKhau.toSHA1(matKhauMoi));
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
	
	// kết quả tìm kiếm chuyến bay
	private void timChuyenBay(HttpServletRequest request, HttpServletResponse response) {
		try {
			String diemDi = request.getParameter("diemKhoiHanh");
			String diemDen = request.getParameter("diemDen");
			String loaiVe = request.getParameter("loaiVe");
			String ngayDi = request.getParameter("departure-date");
			String ngayVe = request.getParameter("return-date");
			
			
			TuyenBay tuyenBayDi = TuyenBayDAO.layQuaDiemDiVaDen(diemDi, diemDen);
			TuyenBay tuyenBayVe = TuyenBayDAO.layQuaDiemDiVaDen(diemDen, diemDi);
			
			
			ArrayList<ChuyenBay> chuyenBayDi = null;
			ArrayList<ChuyenBay> chuyenBayVe = null;
			
			if(tuyenBayDi!=null) {
				chuyenBayDi = ChuyenBayDAO.layQuaMaTuyenBayVaNgayDi(tuyenBayDi.getMaTuyenBay(), ngayDi);
			}
			if(tuyenBayVe!=null) {
				chuyenBayVe = ChuyenBayDAO.layQuaMaTuyenBayVaNgayDi(tuyenBayVe.getMaTuyenBay(), ngayVe);
			}
			
			
			String baoLoiDi = "";
			String baoLoiVe = "";
			String url = "/chonchuyenbay.jsp";
			
			if(chuyenBayDi == null || chuyenBayDi.isEmpty()) {
				chuyenBayDi = null;
				baoLoiDi = "Không tìm thấy chuyến bay đi phù hợp";
			}
			
			if(chuyenBayVe == null ||chuyenBayVe.isEmpty()) {
				chuyenBayVe = null;
				baoLoiVe = "Không tìm thấy chuyến bay về phù hợp";
			}
			
			HttpSession session = request.getSession();
			session.setAttribute("tuyenBayDi", tuyenBayDi);
			session.setAttribute("tuyenBayVe", tuyenBayVe);
			session.setAttribute("chuyenBayDi", chuyenBayDi);
			session.setAttribute("chuyenBayVe", chuyenBayVe);
			
			session.setAttribute("ngayDi", ngayDi);
			session.setAttribute("ngayVe", ngayVe);
			session.setAttribute("loaiVe", loaiVe);
			
			request.setAttribute("baoLoiDi", baoLoiDi);
			request.setAttribute("baoLoiVe", baoLoiVe);
			
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
			
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}
	
	// lọc chuyến bay
	private void locChuyenBay(HttpServletRequest request, HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
	        Object dscbd = session.getAttribute("chuyenBayDi");
	        Object dscbv = session.getAttribute("chuyenBayVe");
	        String price = request.getParameter("price");
	        String time = request.getParameter("time");
	        
	        System.out.println(dscbd); System.out.println(dscbv);
	        
	        ArrayList<ChuyenBay> danhSachChuyenBayDi = null;
	        ArrayList<ChuyenBay> danhSachChuyenBayVe = null;
	        ArrayList<ChuyenBay> chuyenBayDiDaLoc = null;
	        ArrayList<ChuyenBay> chuyenBayVeDaLoc = null;
	        
	        if (dscbd != null && dscbd instanceof ArrayList<?>) {
	            danhSachChuyenBayDi = (ArrayList<ChuyenBay>) dscbd;
	        }
	        
	        if (dscbv != null && dscbv instanceof ArrayList<?>) {
	            danhSachChuyenBayVe = (ArrayList<ChuyenBay>) dscbv;
	        }
	        
	        String baoLoiLocDi = "";
	        String baoLoiLocVe = "";
	        if(!time.equals("all")) {
	        	
	        	if(danhSachChuyenBayDi!=null) {
	        		chuyenBayDiDaLoc = locChuyen(danhSachChuyenBayDi, price, time);
		        	if(chuyenBayDiDaLoc.isEmpty()) {
		        		baoLoiLocDi = "Không tìm thấy chuyến bay phù hợp";
		        		chuyenBayVeDaLoc = null;
		        	}
	        	}
	        	
	        	if(danhSachChuyenBayVe!=null) {
	        		chuyenBayVeDaLoc = locChuyen(danhSachChuyenBayVe, price, time);
		        	if(chuyenBayVeDaLoc.isEmpty()) {
		        		baoLoiLocVe = "Không tìm thấy chuyến bay phù hợp";
		        		chuyenBayVeDaLoc = null;
		        	}
	        	}
	        }
	        System.out.println(danhSachChuyenBayDi);
	        System.out.println(danhSachChuyenBayVe);
	        
	        System.out.println(chuyenBayDiDaLoc);
	        System.out.println(chuyenBayVeDaLoc);
	        
	        session.setAttribute("chuyenBayDiDaLoc", chuyenBayDiDaLoc);
	        session.setAttribute("chuyenBayVeDaLoc", chuyenBayVeDaLoc);
	        request.setAttribute("baoLoiDi", baoLoiLocDi);
	        request.setAttribute("baoLoiVe", baoLoiLocVe);
	        
	        RequestDispatcher rd = getServletContext().getRequestDispatcher("/chonchuyenbay.jsp");
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
	private void yeuCauHoTro(HttpServletRequest request, HttpServletResponse response) {
		try {
			String tieuDe = request.getParameter("vanDeCSKH");
			String maVe = request.getParameter("maVeCSKH");
			String moTa = request.getParameter("moTa");
			String email = request.getParameter("memberEmailCSHK");
			LocalDateTime ldt = LocalDateTime.now();
	        Date thoiGian = Date.valueOf(ldt.toLocalDate());
			HoTro ht = new HoTro(maVe, tieuDe, email, thoiGian, moTa, false);
			HoTroDAO htd = new HoTroDAO();
			htd.Add(ht);
			HttpSession session = request.getSession();
			session.setAttribute("thongBao", "Yêu cầu của bạn đã được tiếp nhận. Chúng tôi sẽ phản hồi qua email sớm nhất có thể");
			
			String url ="/index.jsp";
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}
	
	// hàm lọc danh sách chuyến bay
	private ArrayList<ChuyenBay> locChuyen(ArrayList<ChuyenBay> danhSachChuyenBay, String price, String time) {
		 ArrayList<ChuyenBay> danhSachDaLoc = new ArrayList<ChuyenBay>();
		 if(time.equals("morning")) {
			 for(ChuyenBay cb : danhSachChuyenBay) {
				 LocalTime gioBay = cb.getGioBay().toLocalTime();
			        if (gioBay.isAfter(LocalTime.of(4, 0, 0)) && gioBay.isBefore(LocalTime.of(12,0,0))) {
					 danhSachDaLoc.add(cb);
				 }
			 }
		 } else if(time.equals("afternoon")) {
			 for(ChuyenBay cb : danhSachChuyenBay) {
				 LocalTime gioBay = cb.getGioBay().toLocalTime();
			        if (gioBay.isAfter(LocalTime.of(12, 0, 0)) && gioBay.isBefore(LocalTime.of(18,0,0))) {
					 danhSachDaLoc.add(cb);
				 }
			 }
		 } else if(time.equals("evening")) {
			 for(ChuyenBay cb : danhSachChuyenBay) {
				 LocalTime gioBay = cb.getGioBay().toLocalTime();
			        if (gioBay.isAfter(LocalTime.of(18, 0, 0)) && gioBay.isBefore(LocalTime.of(4,0,0))) {
					 danhSachDaLoc.add(cb);
				 }
			 }
		 }
		return danhSachDaLoc;
	}
}