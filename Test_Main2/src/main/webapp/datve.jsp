<!-- import các lớp vào  -->
<%@page import="model.ChuyenBay"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="./assets/css/style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300..800;1,300..800&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<link rel="stylesheet" type="text/css"
	href="https://npmcdn.com/flatpickr/dist/themes/material_blue.css">
<title>Document</title>

<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>

</head>
<body>
	<form action="<%=url%>/khach-hang-controller" method="post">
		<input type="hidden" name="hanhDong" value="chon-chuyen-bay" />

		<div class="container">
			<!-- Begin Header -->
			<div class="header">
				<div class="logo">
					<a href="#"><h2>Tripma</h2></a>
				</div>
				<div class="nav-header">
					<ul class="list">
						<li><a href="#"><p>Chuyến bay</p></a></li>
						<li><a href="#"><p>Hỗ trợ khách hàng</p></a></li>
						<li><a href="#"><p>Dịch vụ</p></a></li>
						<li><a href="#"><p>Đăng nhập</p></a></li>
						<li><a href="#"><p class="nav-active">Đăng ký</p></a></li>
					</ul>
				</div>
			</div>
			<!-- End Header -->

			<!-- Begin Body -->
			<div class="body">
				<!-- Flight Search -->
				<div class="flight-search">
					<div class="wrapper  hiden-border-right">
						<!-- From ... -->
						<div class="search-item">
							<img src="./assets/icon/Search/departure.png" alt=""> <input
								class="input-search" type="text" placeholder="Từ" name="diemDi">
							<div class="autobox">
								<ul class="innerAutoBox"></ul>
							</div>
						</div>
						<!-- To ... -->
						<div class="search-item">
							<img src="./assets/icon/Search/arrival.png" alt=""> <input
								class="output-search" type="text" placeholder="Đến"
								name="diemDen">
							<div class="autobox-o autobox">
								<ul class="innerAutoBox-o">
								</ul>
							</div>
						</div>
						<!-- Departure Date -->
						<div class="search-item">
							<img src="./assets/icon/Search/calendar.png" alt=""> <input
								class="depart-date" id="myID" type="datetime-local"
								placeholder="Ngày khởi hành" name="ngayDi">
						</div>
						<!-- Return Date -->
						<div class="search-item">
							<img src="./assets/icon/Search/calendar.png" alt=""> <input
								class="return-date" id="myID" type="datetime-local"
								placeholder="Ngày trở về" name="ngayVe">
						</div>
						<!-- Passenger -->
						<div class="search-item hiden-border-right">
							<img src="./assets/icon/Search/adult.png" alt=""> <input
								class="number-people" type="value" placeholder="Người lớn">
							<div class="number-box">
								<li>
									<div class="number-left">
										<p>Người lớn</p>
									</div>
									<div class="number-right adult">
										<img class="minus-adult" src="./assets/img/icon/minus.svg"
											alt=""> <span>0</span> <img class="plus-adult"
											src="./assets/img/icon/plus.svg" alt="">
									</div>
								</li>
								<li>
									<div class="number-left">
										<p>Trẻ em</p>
									</div>
									<div class="number-right child">
										<img class="minus-child" src="./assets/img/icon/minus.svg"
											alt=""> <span>0</span> <img class="plus-child"
											src="./assets/img/icon/plus.svg" alt="">
									</div>
								</li> <img class="number-close" src="./assets/img/icon/close.svg"
									alt="">
							</div>
						</div>
						<!-- Search Button -->
						<div class="search-item">
							<button class="btn-search" type="submit">Tìm kiếm</button>
						</div>
					</div>
				</div>
				<!-- End Flight Search -->

				<!-- Filter bar -->

				<div class="filter-bar">
					<div class="filter-item">
						<label for="price-filter">Giá:</label> <select id="price-filter">
							<option value="economy">Thấp nhất</option>
							<option value="business">Cao nhất</option>
						</select>
					</div>
					<div class="filter-item">
						<label for="time-filter">Thời gian:</label> <select
							id="time-filter">
							<option value="all">Tất cả</option>
							<option value="morning">Buổi sáng</option>
							<option value="afternoon">Buổi chiều</option>
							<option value="evening">Buổi tối</option>
						</select>
					</div>
					<div class="filter-item">
						<label for="seat-filter">Loại ghế:</label> <select
							id="seat-filter">
							<option value="all">Tất cả</option>
							<option value="economy">Phổ thông</option>
							<option value="business">Thương gia</option>
						</select>
					</div>
				</div>
				<!-- End Filter bar -->

				<!-- Flight List -->
				<div class="flight-list">
					<div class="col-1">
						<h3>Chọn chuyến bay dành cho bạn!</h3>
						<div class="box-flight-list">

							<div class="flight-list-header">
								<div class="flight-date per-20">Ngày bay</div>
								<div class="departure per-20">Khởi hành</div>
								<div class="arrival per-20">Đến</div>
								<div class="flight-code per-20">Chuyến bay</div>
								<div class="fare-options per-20">Phổ thông</div>
								<div class="fare-options per-20">Thương gia</div>
							</div>

							<div class="flight-lists">

							<!-- Hiển thị danh sách được tìm thấy -->
							<% 
								Object obj = session.getAttribute("danhSachChuyenBay");
								Object err = session.getAttribute("baoLoi");
								ArrayList<ChuyenBay> chuyenBay = null;
								String baoLoi = "";
								if(obj instanceof ArrayList) {
									chuyenBay = (ArrayList<ChuyenBay>)obj; // méo hiểu sao lỗi hè
								}
								
								if(err!=null) {
									baoLoi = (String)err;
								}
								
								if(chuyenBay!=null) {
									for(ChuyenBay cb : chuyenBay) {
							%>

								<div class="flight-item">
									<div class="flight-date per-20"><%=cb.getNgayBay()%></div>
									<div class="departure per-20">
										<div class="departure-time"><%=cb.getDiemDi()%>, </div>
										<div class="departure-time"><%=cb.getGioBay()%>, </div>
									
										<div class="departure-airport">Nội Bài</div>
									</div>
									<div class="arrival per-20">
										<div class="arrival-time"><%=cb.getDiemDen()%>, 10:00</div>
										<div class="arrival-airport">Tân Sơn Nhất</div>
									</div>
									<div class="flight-code per-20"><%=cb.getMaChuyenBay()%></div>
									<div class="fare-options per-20">
										<label> <input type="radio" name="fare-type"
											value="economy"> <span class="fare-price">500,000 VND</span>
										</label>

									</div>
									<div class="fare-options per-20">
										<label> <input type="radio" name="fare-type"
											value="business"> <span class="fare-price">600,000 VND</span>
										</label>
									</div>
								</div>
							<%}}
								else {
							%>
							<div class="flight-item"><%=baoLoi%></div>
							<%}%>
							</div>
						</div>
					</div>
					<div class="col-2"></div>
				</div>
			</div>
			<!-- End Body -->
		</div>

	</form>
</body>
<script src="./assets/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script>
	flatpickr("#myID", {
		altFormat : "F j, Y",
		dateFormat : "Y-m-d",
		minDate : "today"
	});
</script>
</html>