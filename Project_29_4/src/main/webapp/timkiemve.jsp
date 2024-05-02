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
	<jsp:include page="./header.jsp"></jsp:include>
	
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
	
	
	<div class="trangchonchuyenbay row" style ="display: block">
		<div class="container">
			<!-- Filter bar -->
			<form action="<%=url%>/khach-hang-controller" method = "POST">
			<input type = "hidden" name ="hanhDong" value ="loc-chuyen-bay"/>
				<div class="filter-bar row row col-xs-12  col-md-7">
					<label for="price-filter" class="filter-bar__item" >Giá:</label> 
					<select id="price-filter" class="filter-bar__item item-select" name = "price">
						<option value="economy">Thấp nhất</option>
						<option value="business">Cao nhất</option>
					</select> 
					<label for="time-filter" class="filter-bar__item" >Thời gian:</label> 
					<select id="time-filter" class="filter-bar__item item-select" name = "time">
						<option value="all">Tất cả</option>
						<option value="morning">Buổi sáng</option>
						<option value="afternoon">Buổi chiều</option>
						<option value="evening">Buổi tối</option>
					</select>
					<button type=submit class="timkiemchuyenbay__phantu timkiemchuyenbay__phantu--btnTimChuyenBay " style ="margin: 0 50px">
	                        Lọc
	                </button>
				</div>
			</form>
			<!-- End Filter bar -->
			<div class="row">
				<div class="col-xs-12  col-md-7">
					<div class="title row">
						<span>Chọn chuyến bay dành cho bạn!</span>
					</div>
				</div>
			</div>
			<!-- Flight List -->
			<div class="row">
				<div class="flight-list col-xs-12 col-md-7">
				    <div class="box-flight-list">
				        <div class="flight-list-header row">
				            <div class="flight-list-header__item">Thời gian bay</div>
				            <div class="flight-list-header__item">Giờ bay</div>
				            <div class="flight-list-header__item">Mã Chuyến Bay</div>
				            <div class="flight-list-header__item">Giá</div>
				        </div>
				        
				        <div class="flight-lists row">
				            <% 
					            Object dscb = session.getAttribute("danhSachChuyenBay");
					            Object tb = session.getAttribute("tuyenBay");
					            Object cbdl =  session.getAttribute("chuyenBayDaLoc");
					            
					            String baoLoitk =  request.getAttribute("baoLoi") +"";
					            baoLoitk = (baoLoitk.equals("null")|| baoLoitk == null) ? "" : baoLoitk;
				                TuyenBay tuyenBay = (TuyenBay) tb;
				            
					           
				            	ArrayList<ChuyenBay> danhSachChuyenBay = null;
				            	if( cbdl!= null) {
				            		danhSachChuyenBay =(ArrayList<ChuyenBay>)cbdl;
				            	} else if(dscb != null) {
				            		danhSachChuyenBay =(ArrayList<ChuyenBay>) dscb;
				            	}
					            	
					            	if(!baoLoitk.equals("")) { 
							%>
				            	<div class="flight-item" style ="display: block">
				            	 	<div class="flight-option" style ="color: red; font-size: 16px">
				            	 		<%=baoLoitk%>
				            	 	</div>
				            	</div>
				            <% } else { 
				            	for (ChuyenBay cb : danhSachChuyenBay) {
					              	
				            %>
				            
				            <div class="flight-item">
				                <div class="flight-option">
				                    <div class="flight-item__content" id="flight-option__thoigianbay"><%=tuyenBay.getThoiGianBay() %> giờ</div>
				                    <div class="flight-item__content" id="flight-option__thoigiandi-den"><%=cb.getGioBay()%></div>
				                    <div class="flight-item__content required" id="flight-option__maCB"><%=cb.getMaChuyenBay()%></div>
				                    <div class="fare-options" id="flight-option__gia">500.000VND</div>
				                </div>
				            </div>
				            	
				            <% 
				            	}}
				            %>
				        </div>
				    </div>
				</div>
				
				<div class="col-xs-12  col-md-5">
					<div class="chyenbayduocchon">
						<div class="chyenbayduocchon__chuyenbay"
							id="chuyenbayduocchon__chuyendi">
							<div class="chyenbayduocchon__title">Chuyến Đi</div>
							<div class="chyenbayduocchon__chitietchuyenbay">
								<div class="chyenbayduocchon__item">
									<div class="chyenbayduocchon__item__part">
										<span class="required">CB1</span>
									</div>
									<div
										class="chyenbayduocchon__item__part chyenbayduocchon__item__part--text-align-right">
										<span class="chyenbayduocchon-thongtin">16h 45m</span> <br>
										<span class="chyenbayduocchon-thongtin">7:00AM - 4h15
											PM</span> <br> <span
											class="chyenbayduocchon-thongtin color-grey">Hồ Chí
											Minh Đến Hà Nội</span>
									</div>
								</div>
								<div class="chyenbayduocchon__item">
									<div class="chyenbayduocchon__item__part"></div>
									<div class="chyenbayduocchon__item__part">
										<div class="thongtinchitietgiave-item">
											<div class="thongtinchitietgiave-title">Giá vé :</div>
											<div class="thongtinchitietgave-giave">500.000VND</div>
										</div>
										<div class="thongtinchitietgiave-item">
											<div class="thongtinchitietgiave-title">Thuế :</div>
											<div class="thongtinchitietgave-giave">100.000VND</div>
										</div>
										<div class="thongtinchitietgiave-item">
											<div class="thongtinchitietgiave-title">Tổng :</div>
											<div class="thongtinchitietgave-giave">600.000VND</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<br> <br>
						<div class="chyenbayduocchon__chuyenbay"
							id="chuyenbayduocchon__ve">
							<div class="chyenbayduocchon__title">Chuyến Về</div>
							<div class="chyenbayduocchon__chitietchuyenbay">
								<div class="chyenbayduocchon__item">
									<div class="chyenbayduocchon__item__part">
										<span class="required">CB1</span>
									</div>
									<div
										class="chyenbayduocchon__item__part chyenbayduocchon__item__part--text-align-right">
										<span class="chyenbayduocchon-thongtin">16h 45m</span> <br>
										<span class="chyenbayduocchon-thongtin">7:00AM - 4h15
											PM</span> <br> <span
											class="chyenbayduocchon-thongtin color-grey">Hồ Chí
											Minh Đến Hà Nội</span>
									</div>
								</div>
								<div class="chyenbayduocchon__item">
									<div class="chyenbayduocchon__item__part"></div>
									<div class="chyenbayduocchon__item__part">
										<div class="thongtinchitietgiave-item">
											<div class="thongtinchitietgiave-title">Giá vé :</div>
											<div class="thongtinchitietgave-giave">500.000VND</div>
										</div>
										<div class="thongtinchitietgiave-item">
											<div class="thongtinchitietgiave-title">Thuế :</div>
											<div class="thongtinchitietgave-giave">100.000VND</div>
										</div>
										<div class="thongtinchitietgiave-item">
											<div class="thongtinchitietgiave-title">Tổng :</div>
											<div class="thongtinchitietgave-giave">600.000VND</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="thanhchuyentiep">
					<div class="tongtienchuyenbay">
						<span class="tongtien">Tổng Tiền:</span> <span class="tongtien">0
							VND</span>
					</div>
					<button type="button" class="_btn">Tiếp theo</button>
				</div>
			</div>
		</div>
	</div>
	
	<jsp:include page="./footer.jsp"></jsp:include>
	
	
	<!-- java script -->
	<script>
    document.getElementById("price-filter").addEventListener("change", function() {
        var selectedValue = this.value;
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "FilterServlet?price=" + selectedValue, true);
        xhr.send();
    });
</script>
</body>
</html>