package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.Time;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Random;

import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import javax.activation.DataHandler;
import javax.activation.DataSource;

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
		} else if (hanhdong.equals("them-chuyen-bay")) {
			themChuyenBay(request, response);
		} else if (hanhdong.equals("phan-hoi-hotro")) {
            phanHoiHoTro(request, response);
		} else if (hanhdong.equals("tim-kiem-cskh")) {
			timKiemHoTro(request, response);
		}
	}

	private void timKiemHoTro(HttpServletRequest request, HttpServletResponse response) {
		try {
            String emailHoTro = request.getParameter("input_email-cskh");
            String timeHoTro = (String)request.getParameter("input_time-cskh");
            String trangThai = (String)request.getParameter("trangThai-cskh");
            
            System.out.println("emailHoTro: " + emailHoTro);
            System.out.println("timeHoTro: " + timeHoTro);
            System.out.println("trangThai: " + trangThai);
            
            HoTroDAO hoTroDAO = new HoTroDAO();
            ArrayList<HoTro> allHoTro = hoTroDAO.timKiemHoTro(emailHoTro, timeHoTro, trangThai);
            
            if (allHoTro == null) {
                System.out.println("Không tìm thấy yêu cầu hỗ trợ");
            } else {
                System.out.println("Tìm thấy " + allHoTro.size() + " yêu cầu hỗ trợ");
             }
            
            HttpSession session = request.getSession();
            session.setAttribute("allHoTro", allHoTro);
            
            String url = "/staff/customer-care.jsp";
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	private void phanHoiHoTro(HttpServletRequest request, HttpServletResponse response) throws IOException {
	    try {
	        String idHoTro = request.getParameter("idHoTro");
	        String responseMessage = request.getParameter("responseMessage");
	        
	        System.out.println("idHoTro: " + idHoTro);
	        System.out.println("responseMessage: " + responseMessage);
	        
	        HoTroDAO hoTroDAO = new HoTroDAO();
	        HoTro hoTro = hoTroDAO.selectByID(idHoTro);
	        
	        if (hoTro != null && responseMessage != null && !responseMessage.trim().isEmpty()) {
	            // Gửi email phản hồi
	            sendEmailResponse(hoTro.getEmail(), responseMessage);

	            // Cập nhật trạng thái yêu cầu hỗ trợ
	            hoTro.setTrangThai(true);
	            hoTroDAO.Update(hoTro);

	            // Điều hướng lại trang danh sách hỗ trợ
	            response.sendRedirect("nhan-vien-controller?hanhDong=cham-soc-khach-hang");
	        } else {
	            response.sendRedirect("nhan-vien-controller?hanhDong=cham-soc-khach-hang&error=invalid_request");
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        response.sendRedirect("nhan-vien-controller?hanhDong=cham-soc-khach-hang&error=exception");
	    }
	}

	private void sendEmailResponse(String email, String responseMessage) {
	    String host = "smtp.gmail.com";
	    final String from = "nhattuan242@gmail.com";
	    final String password = "tqaacujvwitpnqsn";

	    Properties props = new Properties();
	    props.put("mail.smtp.host", host); // SMTP Host
	    props.put("mail.smtp.port", "587"); // TLS Port
	    props.put("mail.smtp.auth", "true"); // Enable Authentication
	    props.put("mail.smtp.starttls.enable", "true"); // Enable StartTLS

	    Authenticator auth = new Authenticator() {
	        @Override
	        protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(from, password);
	        }
	    };
	    
	    Session session = Session.getInstance(props, auth);      
	    // Create MimeMessage
	    MimeMessage msg = new MimeMessage(session);
	    try {
	        // Set Message
	        msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
	        // Set From
	        msg.setFrom(new InternetAddress(from));
	        // Set To
	        msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
	        // Set Subject
	        msg.setSubject("PHẢN HỒI YÊU CẦU HỖ TRỢ TỪ BACONCUU AIRLINES");
	        // Set Date Sent
	        msg.setSentDate(new java.util.Date());
	        // Set Message
	     // Construct the message content
	        String fullMessage = responseMessage + "\n\n"
	                + "Cảm ơn quý khách đã liên hệ với BACONCUU AIRLINES.\n"
	                + "Nếu có bất kỳ câu hỏi nào, xin vui lòng liên hệ chúng tôi: \n"
	                + "Email: support.baconcuuairlines@.com \n"
	                + "Số điện thoại: 0707201045.";

	        // Set the message content
	        msg.setText(fullMessage, "UTF-8");
	        // Send Email
	        Transport.send(msg);
	    } catch (MessagingException e) {
	        e.printStackTrace();
	    }
	}


	private void themChuyenBay(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("Them chuyen bay");
		try {
			String ngayBayMoi = request.getParameter("ngayBayMoi");
			String lichBayMoi = request.getParameter("lichBayMoi");
			String tuyenBayMoi = request.getParameter("tuyenBayMoi");
			String maMayBayMoi = request.getParameter("maMayBayMoi");
			String giaMoi = request.getParameter("giaMoi");
			
			ChuyenBayDAO chuyenBayDAO = new ChuyenBayDAO();
	        String maxMaChuyenBay = chuyenBayDAO.getMaxMaChuyenBay();
	        
	        String nextMaChuyenBay = generateNextMaChuyenBay(maxMaChuyenBay);
	        
	        System.out.println("maxMaChuyenBay: " + maxMaChuyenBay);
	        System.out.println("nextMaChuyenBay: " + nextMaChuyenBay);
			
			System.out.print("ngayKhoiHanh: " + ngayBayMoi);
			System.out.print("lichBayMoi: " + lichBayMoi);
			System.out.print("tuyenBayMoi: " + tuyenBayMoi);
			System.out.print("maMayBayMoi: " + maMayBayMoi);
			System.out.print("giaMoi: " + giaMoi);
			
			try {
				Connection con = JDBCUtil.getConnection();
				String sql = "INSERT INTO chuyenbay(id_chuyenbay, id_maybay, id_lichbay, id_tuyenbay, ngaybay, gia) VALUES(?, ?, ?, ?, ?, ?)";
				PreparedStatement st = con.prepareStatement(sql);
		        st.setString(1, nextMaChuyenBay);
		        st.setString(2, maMayBayMoi);
		        st.setString(3, lichBayMoi);
		        st.setString(4, tuyenBayMoi);
		        Date ngayKhoiHanh = Date.valueOf(ngayBayMoi);
		        Double gia_Moi = Double.parseDouble(giaMoi);
		        st.setDate(5, ngayKhoiHanh);
		        st.setDouble(6, gia_Moi);
		        st.executeUpdate();
		        System.out.println("Thêm chuyến bay thành công");
		        JDBCUtil.closeConnection(con);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			HttpSession session = request.getSession();
			
			qlChuyenBay(request, response);
		} catch (Exception e) {
			System.err.println(e.toString());
		}
	}
	
	private String generateNextMaChuyenBay(String maxMaChuyenBay) {
	    if (maxMaChuyenBay == null || maxMaChuyenBay.isEmpty()) {
	        return "CB1";
	    }
	    String numericPart = maxMaChuyenBay.substring(2);
	    int nextNumber = Integer.parseInt(numericPart) + 1;
	    return "CB" + nextNumber;
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
			//cbd.Delete(chuyenBayXoa1);
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
			session.removeAttribute("nhanVien");
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
			
			HoaDonDAO hoaDonDAO = new HoaDonDAO();
			ArrayList<HoaDon> allHoaDon = hoaDonDAO.selectAll();
			
			String url = "/staff/revenue.jsp";
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
			
			ArrayList<TuyenBay> allTuyenBay = new TuyenBayDAO().selectAll();
			ArrayList<LichBay> allLichBay = new LichBayDAO().selectAll();
			ArrayList<MayBay> allMayBay = new MayBayDAO().selectAll();
			
			session.setAttribute("allTuyenBay", allTuyenBay);
			session.setAttribute("allLichBay", allLichBay);
			session.setAttribute("allMayBay", allMayBay);
			
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
			System.out.println("VAO CHAM SOC KHACH HANG");
			HttpSession session = request.getSession();
			response.setContentType("text/html;charset=UTF-8");
			
			ArrayList<HoTro> allHoTro = new HoTroDAO().selectAll();
			
			if (allHoTro != null || !(allHoTro.isEmpty())) {
				System.out.print("Khong rong nhe");
			} else {
				System.out.print("Rong nhe");
			}
			
			session.setAttribute("allHoTro", allHoTro);
			
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
