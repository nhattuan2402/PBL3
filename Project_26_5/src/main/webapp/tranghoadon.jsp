<%@page import="java.util.Random"%>
<%@page import="database.TuyenBayDAO"%>
<%@page import="model.TuyenBay"%>
<%@page import="model.QuanLyChuyenBay"%>
<%@page import="model.HoaDon"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 
<title>website bán vé máy bay Baconcuu</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<link rel="stylesheet" href="./assets/style/base.css" />
<link rel="stylesheet" href="./assets/style/main.css" />
<link rel="stylesheet" href="./assets/style/trangkhachhang.css" /> 
<link rel="stylesheet" href="./assets/style/tranghoadon.css" />

<script src="./assets/events/event_index.js"></script>
<script src="./assets/events/trangkhachhang.js"></script>

</head>
<body>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			list_month(), list_year(), list_date(), MobileCountry()
		});
	</script>
	<%
		int tongHanhLy =Integer.parseInt( session.getAttribute("tongHanhLy").toString());
		HoaDon hoaDon = (HoaDon) session.getAttribute("hoaDon");
		QuanLyChuyenBay quanLyDi = (QuanLyChuyenBay)session.getAttribute("quanLyDi");
		Object quanLyVeObj = session.getAttribute("quanLyVe");
		QuanLyChuyenBay quanLyVe = (quanLyVeObj != null) ? (QuanLyChuyenBay)quanLyVeObj : null;
		
		TuyenBay tuyenDi = TuyenBayDAO.layQuaDiemDiVaDen(quanLyDi.getChuyenBay().getDiemDi(), quanLyDi.getChuyenBay().getDiemDen());
		TuyenBay tuyenVe = null;
		if(quanLyVe!=null) {
			tuyenVe = TuyenBayDAO.layQuaDiemDiVaDen(quanLyVe.getChuyenBay().getDiemDi(), quanLyVe.getChuyenBay().getDiemDen());
		}
		int random = new Random().nextInt(100000000);
		int tienKhuyenMai = Integer.parseInt(session.getAttribute("tienKhuyenMai").toString());
	%>
	<jsp:include page="header.jsp"></jsp:include>
	<div class="tranghoadon row">
		<div class="container">
			<div class="row">
				<div class="thongTinHanhKhach__tieuDe col-xs-12  col-md-7 ">
					<div class="motatrangthaithanhtoan">
						Chuyến bay của bạn đã được đặt thành công! Số xác nhận của bạn là
						#<%=random %></div>
					<div class="title title--thongTinHanhKhach">Chúc chuyến
						đi vui vẻ</div>
					<div class=" desc--thongtinhanhkhach text-grey-color desc--hoadon">
						Mã số xác nhận :<%=random %></div>	
					<div class=" desc--thongtinhanhkhach desc--hoadon">
						Cảm ơn bạn đã đặt chuyến đi của bạn với Baconcuu airline! Dưới đây
						là tóm tắt chuyến đi của bạn. Chúng tôi đã gửi một bản sao xác
						nhận đến địa chỉ email của bạn. Bạn cũng có thể tìm lại trang này
						trong <span class="text-brand-color"> Chuyến đi của tôi</span>.
					</div>
				</div>
				<div class="thongTinHanhKhach col-xs-12  col-md-7 ">
					<div class="title__thongtinchuyenbay">Tóm Tắt Chuyến Bay</div>
					<div class="container__VeHoanThanh class__Vemaybay">

						<div class="vemaybay-mota box-shadow">
							<div class="motatinhtrangve">
								<div class="mave-tieude">
									Mã hóa đơn: <span class="noidung-mave"><%=hoaDon.getMaHoaDon() %></span>
								</div>
								<div class="tinhtrang">Đã Thanh Toán</div>
							</div>
							<!--ve chuyen di-->
							<div class="vemaybay box-shadow">
								<div class="ve-tieude">Chuyến đi</div>
								<div class="noidungve">
									<div class="thoigiandi"><%=quanLyDi.getChuyenBay().getNgayBay() %></div>
									<div class="ve-thongtinchuyenbay">
										<div class="thongtinhanhtrinhchitiet">
											<div class="ve-thongtinhanhtrinh">
												<div class="ve-lotrinh">
													<div class="ve-thanhpho"><%=quanLyDi.getChuyenBay().getDiemDi() %></div>
													<div class="ve-thoigian"><%=quanLyDi.getChuyenBay().getGioBay() %></div>
												</div>
											</div>

											<div class="thongtinbay">
												<div class="thanhphan"><%=tuyenDi.getThoiGianBay()%>
													h
												</div>
												<div class="thanhphan icon-vemaybay">
													<i class="fa-solid fa-plane"></i>
												</div>
												<div class="thanhphan">
													Bay Thẳng | <span class="chitietchuyenbay">Chi tiết
													</span><span class="icondong "><i
														class="fa-solid fa-angle-up fa-rotate-180"></i></span><span
														class="inconxo hidden"><i
														class="fa-solid fa-angle-up"></i></span>
												</div>
											</div>

											<div class="ve-thongtinhanhtrinh">
												<div class="ve-lotrinh">
													<div class="ve-thanhpho"><%=quanLyDi.getChuyenBay().getDiemDen()%></div>
												</div>
											</div>
										</div>
										<div class="thongtinsoluonghanhkhach"><%=quanLyDi.getSoHanhKhach() %>
											Hành khách
										</div>
									</div>
								</div>
							</div>
							<div class="chitietve hidden ">
								<div class="chitietvenoidung">
									<div class="chitietvenoidung__sohieuchuyenbay">
										<div
											class="chitietchuyenbay__lichtrinh-icon thanhphan icon-vemaybay">
											<i class="fa-solid fa-plane"></i>
										</div>
										<div class="chitietchuyenbay__daumuc">Số hiệu chuyến
											bay:</div>
										<span class="sohieuchuyenbay"><%=quanLyDi.getChuyenBay().getMaChuyenBay()%></span>
									</div>
									<div class="chitietvenoidung__lichtrinhbay">
										<div class="chitietchuyenbay__lichtrinh">
											<div
												class="chitietchuyenbay__lichtrinh-icon icondiemkhoihanh">
												<i class="fa-solid fa-map-pin"></i>
											</div>
											<div class="lichtrinhbay diemkhoihanh">
												<div class="chitietchuyenbay__daumuc">Khởi hành:</div>
												<div>
													<span class="noidunglichtrinh"><%=quanLyDi.getChuyenBay().getGioBay()%>,
														<%=quanLyDi.getChuyenBay().getNgayBay() %> (Giờ địa
														phương)</span> <br> <span class="noidunglichtrinh"><%=quanLyDi.getChuyenBay().getDiemDi() %></span>
												</div>
											</div>
										</div>
										<div class="chitietchuyenbay__lichtrinh">
											<div class="chitietchuyenbay__lichtrinh-icon icondiemden">
												<i class="fa-solid fa-location-dot"></i>
											</div>
											<div class="lichtrinhbay">
												<div class="chitietchuyenbay__daumuc">Đến:</div>
												<div>
													<span class="noidunglichtrinh"><%=quanLyDi.getChuyenBay().getDiemDen()%></span>
												</div>
											</div>
										</div>
										<div class="chitietchuyenbay__thongtinchuyen">
											<span class="chitietchuyenbay__daumuc"> Thời gian: </span><span
												class="thongtinchuyenbay__noidung"><%=tuyenDi.getThoiGianBay()%>h</span>
											<span class="chitietchuyenbay__daumuc"> Airbus: </span><span
												class="thongtinchuyenbay__noidung"><%=quanLyDi.getChuyenBay().getMaMayBay()%></span>
											<span class="chitietchuyenbay__daumuc"> Khai thác bởi:</span>
											<span class="thongtinchuyenbay__noidung">Baconcuu airline</span>
										</div>
									</div>
								</div>
							</div>
							<!--/. kết thúc ve chuyen di-->

							<!-- ve chuyen ve-->

							<%if(quanLyVe!=null){ %>
							<div class="vemaybay">
								<div class="ve-tieude tieudechuyenve">Chuyến về</div>
								<div class="noidungve">
									<div class="thoigiandi"><%=quanLyVe.getChuyenBay().getNgayBay()%></div>
									<div class="ve-thongtinchuyenbay">
										<div class="thongtinhanhtrinhchitiet">
											<div class="ve-thongtinhanhtrinh">
												<div class="ve-lotrinh">
													<div class="ve-thanhpho"><%=quanLyVe.getChuyenBay().getDiemDi()%></div>
													<div class="ve-thoigian">
														<%=quanLyVe.getChuyenBay().getGioBay()%></div>
												</div>
											</div>

											<div class="thongtinbay">
												<div class="thanhphan"><%=tuyenVe.getThoiGianBay()%>
													h
												</div>
												<div class="thanhphan icon-vemaybay">
													<i class="fa-solid fa-plane"></i>
												</div>
												<div class="thanhphan">
													Bay Thẳng | <span class="chitietchuyenbay">Chi tiết
													</span><span class="icondong "><i
														class="fa-solid fa-angle-up fa-rotate-180"></i></span><span
														class="inconxo hidden"><i
														class="fa-solid fa-angle-up"></i></span>
												</div>
											</div>

											<div class="ve-thongtinhanhtrinh">
												<div class="ve-lotrinh">
													<div class="ve-thanhpho"><%=quanLyVe.getChuyenBay().getDiemDen()%></div>
												</div>
											</div>
										</div>
										<div class="thongtinsoluonghanhkhach"><%=quanLyVe.getSoHanhKhach()%>
											Hành khách
										</div>
									</div>
								</div>
							</div>

							<div class="chitietve hidden">
								<div class="chitietvenoidung">
									<div class="chitietvenoidung__sohieuchuyenbay">
										<div
											class="chitietchuyenbay__lichtrinh-icon thanhphan icon-vemaybay">
											<i class="fa-solid fa-plane"></i>
										</div>
										<div class="chitietchuyenbay__daumuc">Số hiệu chuyến
											bay:</div>
										<span class="sohieuchuyenbay"><%=quanLyVe.getChuyenBay().getMaChuyenBay()%></span>
									</div>
									<div class="chitietvenoidung__lichtrinhbay">
										<div class="chitietchuyenbay__lichtrinh">
											<div
												class="chitietchuyenbay__lichtrinh-icon icondiemkhoihanh">
												<i class="fa-solid fa-map-pin"></i>
											</div>
											<div class="lichtrinhbay diemkhoihanh">
												<div class="chitietchuyenbay__daumuc">Khởi hành:</div>
												<div>
													<span class="noidunglichtrinh"><%=quanLyVe.getChuyenBay().getGioBay()%>,
														<%=quanLyVe.getChuyenBay().getNgayBay()%> (Giờ địa phương)</span>
													<br> <span class="noidunglichtrinh"><%=quanLyVe.getChuyenBay().getDiemDi() %></span>
												</div>
											</div>
										</div>
										<div class="chitietchuyenbay__lichtrinh">
											<div class="chitietchuyenbay__lichtrinh-icon icondiemden">
												<i class="fa-solid fa-location-dot"></i>
											</div>
											<div class="lichtrinhbay">
												<div class="chitietchuyenbay__daumuc">Đến:</div>
												<div>
													<span class="noidunglichtrinh"><%=quanLyVe.getChuyenBay().getDiemDen() %></span>
												</div>
											</div>
										</div>
										<div class="chitietchuyenbay__thongtinchuyen">
											<span class="chitietchuyenbay__daumuc"> Thời gian: </span><span
												class="thongtinchuyenbay__noidung"><%=tuyenVe.getThoiGianBay()%></span>
											<span class="chitietchuyenbay__daumuc"> Airbus: </span><span
												class="thongtinchuyenbay__noidung"><%=quanLyVe.getChuyenBay().getMaMayBay()%></span>
											<span class="chitietchuyenbay__daumuc"> Khai thác bởi:
											</span><span class="thongtinchuyenbay__noidung">Baconcuu
												airline</span>
										</div>
									</div>
								</div>
							</div>
							<%} %>
							<!--/. kết thúc ve chuyen ve-->
						</div>
					</div>
					<!--/. kết thúc vé Hoàn thành-->
				</div>
				<div class="col-xs-12  col-md-5 trangDienThongTin">
					<div>
						<div class="chitietthanhtoan__title__hoadon">Phân Tích Chi
							Tiết Giá</div>
						<div class="noidungchitietthanhtoan__hoadon">
							<div class="thitietthianhtoan__dong__hoadon">
								<div class="tieudemuc">Chuyến đi</div>
								<div class="noidungmuc">
									<span id="tongtientamtinh"><%=(int)(quanLyDi.getChuyenBay().getGia()*1.1)%></span>,000VND
								</div>
							</div>

							<%if(quanLyVe!=null){%>
							<div class="thitietthianhtoan__dong__hoadon">
								<div class="tieudemuc">Chuyến về</div>
								<div class="noidungmuc">
									<span id="tongtienmakhuyenmai"><%=(int)(quanLyVe.getChuyenBay().getGia()*1.1)%></span>,000VND
								</div>
							</div>
							<%} %>
							<div class="thitietthianhtoan__dong__hoadon">
								<div class="tieudemuc">Hàng ký gửi</div>
								<div class="noidungmuc">
									<span id="tongtienmakhuyenmai"><%=tongHanhLy*20 %></span>,000VND
								</div>
							</div>
							<div class="thitietthianhtoan__dong__hoadon">
								<div class="tieudemuc">Tiền ghế</div>
								<%if(quanLyVe!=null){ %>
								<div class="noidungmuc">
									<span id="tongtienphidichvu"><%=(int)(hoaDon.getDonGia()+tienKhuyenMai-quanLyDi.getChuyenBay().getGia()*1.1-quanLyVe.getChuyenBay().getGia()*1.1- tongHanhLy*20)%></span>,000VND
								</div>
								<%}else{ %>
								<div class="noidungmuc">
									<span id="tongtienphidichvu"><%=(int)(hoaDon.getDonGia()-quanLyDi.getChuyenBay().getGia()*1.1- tongHanhLy*20)%></span>,000VND
								</div>
								<%} %>
							</div>
							
							<div class="thitietthianhtoan__dong__hoadon ">
								<div class="tieudemuc">Khuyến mãi</div>
								<div class="noidungmuc">
									<span id="tongtien"><%=tienKhuyenMai%></span>,000VND
								</div>
							</div>
							
							<div class="thitietthianhtoan__dong__hoadon dongtongtien_hoadon">
								<div class="tieudemuc">Tổng tiền</div>
								<div class="noidungmuc">
									<span id="tongtien"><%=hoaDon.getDonGia()%></span>,000VND
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container" style="margin: 0 20%; display: flex; justify-content: center;">
            <a href="index.jsp" ><button type="button" class="_btnChuyenTiep btn__vuong">Quay lại trang chủ</button></a>
    </div>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>