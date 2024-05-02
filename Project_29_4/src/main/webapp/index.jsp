<%@page import="model.TaiKhoan" %>
<%@page import="model.ChuyenBay" %>
<%@page import="model.TuyenBay" %>
<%@page import="java.util.ArrayList" %>
<%@page import="java.sql.Time" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
<script src="./assets/events/event_index.js"></script>
<script src="./assets/events/formdangky.js"></script>
<script src="./assets/events/formdangnhap.js"></script>
<script src="./assets/events/formhotro.js"></script>

<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>

</head>
<body>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			list_month(), list_year(), list_date(), MobileCountry()
		});
	</script>

	<div class="containber">
	
		<!--THANH THÔNG BÁO-->
		<div class="thongBao">
			<diV class="thongbao__noidung">
				<div>Đăng ký Tài khoản để cập nhật các thông tin, ưu đãi mới
					nhất từ Baconcuu Airlines.</div>
			</diV>
			<div class="thongbao__exit exit">
				<i class="fa fa-times " aria-hidden="true"></i>
			</div>
		</div>
		<!--KẾT THÚC THANH THÔNG BÁO-->

		

	<!-- HEADER-->
	<jsp:include page="./header.jsp"></jsp:include>
	<!--KẾT THÚC HEADER-->

	<!--TRANG CHỦ TÌM KIẾM-->
	<div class="trangchu">
		<form  action="<%=url%>/khach-hang-controller" method="post">
			<input type = "hidden" name ="hanhDong" value ="tim-kiem-chuyen-bay"/>
			
			<div class="jumbotron text-center trangchu__timkiemchuyenbay">
				<div class="trangchu__slogan row">
					<span class="slogan col-xs-12  col-md-12">"Fly the friendly
						skies"</span> <br> <br> <br> <br> <br> <br>
					<br>
				</div>
				<div class="container">
					<div class="timkiemchuyenbay slideanim row">
						<div
							class="timkiemchuyenbay__phantu timkiemchuyenbay--chonThanhPho">
							<i class="fa-solid fa-plane-departure"></i> 
							<input type="text" class="timchuyenbay__nhapthanhpho text_demkhoihanh"
								placeholder="Điểm khởi hành?" tabindex="0" name = "diemKhoiHanh">
							<div
								class="timkiemchuyenbay__phantu-chonThanhPho timkiemchuyenbay__phantu-chonThanhPho--Diemdi">
								<ul
									class="timkiemchuyenbay__phantu-list timkiemchuyenbay_thanhphodi">
								</ul>
							</div>
						</div>

						<div
							class="timkiemchuyenbay__phantu timkiemchuyenbay--chonThanhPho">
							<i class="fa-solid fa-plane-arrival"></i>
							 <input type="text" class="timchuyenbay__nhapthanhpho text_demden"
								placeholder="Điểm Đến?" name = "diemDen">
							<div
								class=" timkiemchuyenbay__phantu-chonThanhPho timkiemchuyenbay__phantu-chonThanhPho--Diemden">
								<ul
									class="timkiemchuyenbay__phantu-list timkiemchuyenbay_thanhphoden">
								</ul>
							</div>
						</div>

						<div class="timkiemchuyenbay__phantu">
							<i class="fa-regular fa-calendar"></i> 
							<input type="text" class="btn_lichBay " readonly="readonly" placeholder="Ngày đi - ngày về">
							<div class="timkiemchuyenbay_phantu__chonlich">
								<div class="timkiemchuyenbay__chonlich">
									<label class="timkiemchuyenbay__chonlich__loaive" for="round-trip">Khứ hồi</label> 
										<input class="timkiemchuyenbay__chonlich__loaive" type="radio"
										name="loaiVe" value="Khứ hồi" checked="checked" id="round-trip">
									<label class="timkiemchuyenbay__chonlich__loaive" for="one-way">Một chiều</label> 
										<input class="timkiemchuyenbay__chonlich__loaive" type="radio" 
										name="loaiVe" value="Một chiều" id="one-way">
									<input class="chonlich__btnXacnhan" type="button"
										value="Xác Nhận">
								</div>
								<div class="timkiemchuyenbay__chonlich">
									<label class="timkiemchuyenbay__chonlich-chonngay"
										for="departure-date">Ngày đi:</label>
										<input class="timkiemchuyenbay__chonlich-chonngay" type="text"
										id="departure-date" name="departure-date"
										placeholder="Chọn ngày đi" readonly="readonly">
								</div>
								<div
									class="timkiemchuyenbay__chonlich timkiemchuyenbay__chonlich__ngayve">
									<label class="timkiemchuyenbay__chonlich-chonngay"
										for="return-date">Ngày về:</label>
										<input class="timkiemchuyenbay__chonlich-chonngay" type="date"
										id="return-date" name="return-date"
										placeholder="Chọn ngày về" readonly="readonly">
								</div>

							</div>
						</div>

						<div
							class="timkiemchuyenbay__phantu timkiemchuyenbay__phantu--hienThiSoHanhKhach">
							<i class="fa fa-user"></i> 
							<input type="text" class="HienthiSoHK" placeholder="1 Người lớn" readonly="readonly">
							<div class="demSoKhachHang">
								<table>
									<div class="nguoiLon">
										<tr>
											<td><span>Người lớn:</span></td>
											<td>
												<button type="button" class="btCountNL">-</button> 
												<span class="numberNL">1</span>
												<button type="button" class="btCountNL">+</button>
											</td>
										</tr>
									</div>
									<div class="treEm">
										<tr>
											<td><span>Trẻ em:</span></td>
											<td>
												<button type="button" class="btCountTE">-</button> 
												<span class="numberTE">0</span>
												<button type="button" class="btCountTE">+</button>
											</td>
										</tr>
									</div>
									<div class="timchuyenbay__demsohanhkhach__exit exit">
										<i class="fa-regular fa-circle-xmark"></i>
									</div>
								</table>
							</div>
						</div>
						<button type=submit class="timkiemchuyenbay__phantu timkiemchuyenbay__phantu--btnTimChuyenBay">
							Tìm kiếm chuyến bay
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	<!--KẾT THÚC TRANG CHỦ TÌM KIẾM-->

	<!--CHỌN CHUYẾN BAY-->
	
	
	<!--KẾT THÚC CHỌN CHUYẾN BAY-->

	<!--FOOTER-->
	<jsp:include page="./footer.jsp"></jsp:include>
	<!--KẾT THÚC FOOTER-->
	
</body>
</html>