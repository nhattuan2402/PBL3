package controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDateTime;
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

import database.*;
import model.*;
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
		} else if(hanhdong.equals("chon-chuyen-bay")) {
			chonChuyenBay(request, response);
		} else if(hanhdong.equals("dien-thong-tin")) {
			dienThongTin(request, response);
		} else if(hanhdong.equals("chon-cho-ngoi")) {
			chonChoNgoi(request, response);
		} else if(hanhdong.equals("thay-doi-thong-tin")) {
			thayDoiThongTin(request, response);
		} else if(hanhdong.equals("doi-mat-khau")) {
			doiMatKhau(request, response);
		} else if(hanhdong.equals("thanh-toan")) {
			thanhToan(request, response);
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
				} else if (taiKhoan.getRole().equals("nhanvien")) {
					NhanVienDAO nvd = new NhanVienDAO();
					NhanVien nhanVien = nvd.selectByMaTaiKhoan(taiKhoan.getMaTaiKhoan());
					session = request.getSession();
					
					session.setAttribute("taiKhoan", taiKhoan);
					session.setAttribute("nhanVien", nhanVien);
					session.setAttribute("role", taiKhoan.getRole());
					
					url = "/staff/staff.jsp";
				} else if (taiKhoan.getRole().equals("admin")) {
					System.out.println("admin dang nhap");
					session = request.getSession();
					session.setAttribute("admin", taiKhoan);
					url = "/admin/admin.jsp";
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
			
			String nowString = layNgayGio();
			
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
				String maTaiKhoan = "TKKH" +nowString;
				String maKhachHang = "KH" + nowString;
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
			String hoVaTen = request.getParameter("newHoVaTen");
			String ngaySinh = request.getParameter("newNgaySinh");
			String diaChi = request.getParameter("newDiaChi");
			String gioiTinh = request.getParameter("newGioiTinh");
			
			// giữ lại thông tin
			request.setAttribute("hoVaTen", hoVaTen);
			request.setAttribute("ngaySinh", ngaySinh);
			request.setAttribute("diaChi", diaChi);
			request.setAttribute("gioiTinh", gioiTinh);
			System.out.println(hoVaTen);
			System.out.println(ngaySinh);
			System.out.println(diaChi);
			System.out.println(gioiTinh);
			
			String baoLoi = "";
			String url = "/khachhang.jsp";
			
			request.setAttribute("baoLoi", baoLoi);
			
			if(baoLoi.length()>0) {
				url = "/khachhang.jsp";
			} else {
				HttpSession session =request.getSession();
				Object obj = session.getAttribute("khachHang");
				KhachHang khachHang = null;
				if(obj!=null) {
					khachHang = (KhachHang) obj;
					if(khachHang != null) {
						String maKhachHang = khachHang.getMaKhachHang();
						boolean isGioiTinh = gioiTinh.equals("Nam")?true:false;
						KhachHang kh = new KhachHang(maKhachHang, "", hoVaTen, Date.valueOf(ngaySinh), "", "", diaChi, isGioiTinh);
						KhachHangDAO.capNhatThongTin(kh);
						KhachHang kh2 = KhachHangDAO.selectByMaKhachHang(kh);
						
						session.setAttribute("khachHang", kh2);
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
		try 
			{
			String matKhauMoi = request.getParameter("newMatKhau");
			
			String url = "/khachhang.jsp";
			HttpSession session = request.getSession();
			Object obj = session.getAttribute("taiKhoan");
			TaiKhoan taiKhoan =  (TaiKhoan) obj;
			System.out.println(taiKhoan);
			String matKhauMaHoa = MaHoaMatKhau.toSHA1(matKhauMoi);	
			taiKhoan.setMatKhau(matKhauMaHoa);
			TaiKhoanDAO.thayDoiMatKhau(taiKhoan);
			
			TaiKhoan taiKhoan2 = new TaiKhoanDAO().selectByID(taiKhoan);
			System.out.println(taiKhoan2);
			session.setAttribute("taiKhoan", taiKhoan2);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}
	
	// kết quả tìm kiếm chuyến bay
	private void timChuyenBay(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("goi den tim kiem chuyen bay");
		try {
			String diemDi = request.getParameter("diemKhoiHanh");
			String diemDen = request.getParameter("diemDen");
			String loaiVe = request.getParameter("loaiVe");
			String ngayDi = request.getParameter("departure-date");
			String ngayVe = request.getParameter("return-date");
			String soNguoiLon = request.getParameter("soNguoiLon");
			String soTreEm = request.getParameter("soTreEm");
			
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
			
			System.out.println(loaiVe);
			
			HttpSession session = request.getSession();
			
			session.setAttribute("tuyenBayDi", tuyenBayDi);
			session.setAttribute("tuyenBayVe", tuyenBayVe);
			session.setAttribute("chuyenBayDi", chuyenBayDi);
			session.setAttribute("chuyenBayVe", chuyenBayVe);
			
			session.setAttribute("ngayDi", ngayDi);
			session.setAttribute("ngayVe", ngayVe);
			session.setAttribute("loaiVe", loaiVe);
			session.setAttribute("soNguoiLon", soNguoiLon);
			session.setAttribute("soTreEm", soTreEm);
			
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
	
	// chọn chuyến bay
	private void chonChuyenBay(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("goi den chon chuyen bay");
		try {
			String maCBDi = request.getParameter("maCBDi");
			String maCBVe = request.getParameter("maCBVe");
			int tongTien = 0;
			
			HttpSession session = request.getSession();
			
			ArrayList<ChuyenBay> cbd = (ArrayList<ChuyenBay>)session.getAttribute("chuyenBayDi");
			ChuyenBay chuyenBayDiDuocChon = null;
			for(ChuyenBay cb : cbd) {
				if(cb.getMaChuyenBay().equals(maCBDi)) {
					chuyenBayDiDuocChon = cb;
					tongTien += cb.getGia()*1.1;
					break;
				}
			}
			
			session.setAttribute("chuyenBayDiDuocChon", chuyenBayDiDuocChon);
			session.setAttribute("maCBDi", maCBDi);
			
			Object objChuyenBayVe = session.getAttribute("chuyenBayVe");
			
			ArrayList<ChuyenBay> cbv = null;
			ChuyenBay chuyenBayVeDuocChon = null;
			
			if(objChuyenBayVe!=null) {
				cbv = (ArrayList<ChuyenBay>)objChuyenBayVe;
				for(ChuyenBay cb : cbv) {
					if(cb.getMaChuyenBay().equals(maCBVe)) {
						chuyenBayVeDuocChon = cb;
						tongTien += cb.getGia()*1.1;
						break;
					}
				}
			}
			
			session.setAttribute("chuyenBayVeDuocChon", chuyenBayVeDuocChon);
			session.setAttribute("maCBVe", maCBVe);
			session.setAttribute("tongTien", tongTien);
			
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/dienthongtin.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}
	
	// điền thông tin 
	private void dienThongTin(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("goi den dien thong tin");
		try  {
			HttpSession session = request.getSession();
			int soNguoiLon = Integer.parseInt(session.getAttribute("soNguoiLon").toString());
			int soTreEm = Integer.parseInt(session.getAttribute("soTreEm").toString());
			String tongTien = (request.getParameter("tong_tien"));
			int soHK = soNguoiLon + soTreEm;
			int tongHanhLy = 0;
			String nowString = layNgayGio();
	        
			ArrayList<String> tenHK = new ArrayList<String>();
			
			ArrayList<HanhKhach> danhSachHanhKhach = new ArrayList<HanhKhach>();
			for(int i=1;i<=soNguoiLon;i++) {
				String hoVaTen = request.getParameter("tenNguoiLon"+i);
				String ngaySinh = request.getParameter("ngaySinhNguoiLon"+i);
				String email = request.getParameter("emailNguoiLon"+i);
				String sdt = request.getParameter("sdtNguoiLon"+i);
				String diaChi = request.getParameter("diaChiNguoiLon"+i);
				String quocTich = request.getParameter("quocTichNguoiLon"+i);
				String gioiTinh = request.getParameter("gioiTinhNguoiLon"+i);
				String cccd = request.getParameter("cccdNguoiLon"+i);
				int hanhLy = Integer.parseInt(request.getParameter("KLHLNguoiLon"+i));
				tongHanhLy += hanhLy;
				tenHK.add(hoVaTen);
				
				HanhKhach hk = new HanhKhach("HKNL"+i+nowString,  hoVaTen, Date.valueOf(ngaySinh),sdt, email, diaChi, (gioiTinh.equals("Nam")|| gioiTinh.equals("nam"))?true:false, cccd, quocTich, hanhLy,"","","");
				danhSachHanhKhach.add(hk);
			}
			for(int i=1;i<=soTreEm;i++) {
				String hoVaTen = request.getParameter("tenTreEm"+i);
				String ngaySinh = request.getParameter("ngaySinhTreEm"+i);
				String diaChi = request.getParameter("diaChiTreEm"+i);
				String quocTich = request.getParameter("quocTichTreEm"+i);
				String gioiTinh = request.getParameter("gioiTinhTreEm"+i);
				int hanhLy = Integer.parseInt(request.getParameter("KLHLTreEm"+i));
				tongHanhLy += hanhLy;
				tenHK.add(hoVaTen);
				
				HanhKhach hk = new HanhKhach("HKTE"+i+nowString,  hoVaTen, Date.valueOf(ngaySinh),"", "", diaChi, (gioiTinh.equals("Nam")|| gioiTinh.equals("nam"))?true:false, "", quocTich, hanhLy,"","","");
				danhSachHanhKhach.add(hk);
			}
			
			String url = "/chonchongoi.jsp";
			session.setAttribute("danhSachHanhKhach", danhSachHanhKhach);
			session.setAttribute("soHK", soHK);
			session.setAttribute("tenHK", tenHK);
			session.setAttribute("tongTien", tongTien);
			session.setAttribute("tongHanhLy", tongHanhLy);
			RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
			rd.forward(request, response);
		   
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// chọn chỗ ngồi
	private void chonChoNgoi(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("goi den chon cho ngoi");
		try {
			HttpSession session = request.getSession();
			int soHK = Integer.parseInt(session.getAttribute("soHK").toString());
			ArrayList<HanhKhach> danhSachHanhKhach = (ArrayList<HanhKhach>)session.getAttribute("danhSachHanhKhach");
			
			String nowString = layNgayGio();
			
			String maCBDi = session.getAttribute("maCBDi")+"";
			
			Object maCBVeObj = session.getAttribute("maCBVe");
			String maCBVe = (maCBVeObj != null) ? maCBVeObj.toString() : "";
			
			Object kh = session.getAttribute("khachHang");
			String maKhachHang = "";
			String chuaDangNhap = "";
			if(kh!=null) {
				KhachHang khachhang  = (KhachHang)kh;
				maKhachHang = khachhang.getMaKhachHang();
			} else {
				chuaDangNhap = "Bạn chưa đăng nhập. Để có thể lưu trữ lịch sử giao dịch, bạn nên đăng nhập!";
			}
			int tongTien = Integer.parseInt(session.getAttribute("tongTien").toString());
			QuanLyChuyenBay quanLyDi = new QuanLyChuyenBay("QLCBD"+layNgayGio(), maKhachHang, new ChuyenBayDAO().selectByID(maCBDi), soHK);
			QuanLyChuyenBay quanLyVe = null;
			if(!maCBVe.equals("")) {
				quanLyVe = new QuanLyChuyenBay("QLCBV"+layNgayGio(), maKhachHang, new ChuyenBayDAO().selectByID(maCBVe), soHK);
			}
			for(int i=1;i<=soHK;i++) {
				String maGheDi = request.getParameter("maGheDi"+i);
				String maGheVe = request.getParameter("maGheVe"+i);
				danhSachHanhKhach.get(i-1).setMaGheDi(maGheDi);
				danhSachHanhKhach.get(i-1).setMaGheVe(maGheVe);
				if(maGheDi.contains("TG")) {
					tongTien += 300;
				}
				if(maGheVe!=null) {
					if(maGheVe.contains("TG")){
						tongTien += 300;
					}
				}
			}
			
			HoaDon hd = new HoaDon("HD"+nowString, maKhachHang, maCBDi, maCBVe, null, null, tongTien, null, null);
			for(HanhKhach hk : danhSachHanhKhach) {
				hk.setMaHoaDon(hd.getMaHoaDon());
			}
			session.setAttribute("tongTienCuoiCung", tongTien);
			session.setAttribute("quanLyDi", quanLyDi);
			session.setAttribute("quanLyVe", quanLyVe);
			session.setAttribute("hoaDon", hd);
			session.setAttribute("chuadangnhap", chuaDangNhap);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/phuongthucthanhtoan.jsp");
			rd.forward(request, response);
			
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}
	
	// xuất hóa đơn 
	
	// thanh toán 
	private void thanhToan(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			HttpSession session = request.getSession();
			
			Object kh = session.getAttribute("khachHang");
			String maKhachHang = "";
			if(kh!=null) {
				KhachHang khachhang  = (KhachHang)kh;
				maKhachHang = khachhang.getMaKhachHang();
			}
			
			int tienthanhtoan = Integer.parseInt(request.getParameter("tienthanhtoan"));
			int tienkhuyenmai = Integer.parseInt(request.getParameter("tienkhuyenmai"));
			
			ArrayList<HanhKhach> danhSachHanhKhach =(ArrayList<HanhKhach>)session.getAttribute("danhSachHanhKhach");
			QuanLyChuyenBay quanLyDi = (QuanLyChuyenBay)session.getAttribute("quanLyDi");
			quanLyDi.setMaKhachHang(maKhachHang);
			
			QuanLyChuyenBay quanLyVe = null;
			Object quanLyVeObj = session.getAttribute("quanLyVe");
			if(quanLyVeObj!=null) {
				quanLyVe = (QuanLyChuyenBay)quanLyVeObj;
				quanLyVe.setMaKhachHang(maKhachHang);
			}
			
			HoaDon hoaDon = (HoaDon)session.getAttribute("hoaDon");
			if(tienthanhtoan!=0) {
				hoaDon.setDonGia(tienthanhtoan);
			}
			Date ngayHienTai = new Date(System.currentTimeMillis());
			hoaDon.setNgayDat(ngayHienTai);
			Time gioHienTai = new Time(System.currentTimeMillis());
			hoaDon.setGioThanhToan(gioHienTai);
			hoaDon.setMaKhachHang(maKhachHang);
			
			for(HanhKhach hk : danhSachHanhKhach) {
				new HanhKhachDAO().themHanhKhach(hk);
			}
			if(quanLyVe!=null) {
				QuanLyChuyenBayDAO.themQuanLyChuyenBay(quanLyVe);
			}
			QuanLyChuyenBayDAO.themQuanLyChuyenBay(quanLyDi);
			
			HoaDonDAO.themHoaDon(hoaDon);
			session.setAttribute("tienKhuyenMai", tienkhuyenmai);
			RequestDispatcher rd = getServletContext().getRequestDispatcher("/tranghoadon.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
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
			request.setAttribute("thongBao", "Yêu cầu của bạn đã được tiếp nhận. Chúng tôi sẽ phản hồi qua email sớm nhất có thể");
			
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
	private String layNgayGio() {
		String nowString = null;
		LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
        nowString = now.format(formatter);
        return nowString;
	}
}
