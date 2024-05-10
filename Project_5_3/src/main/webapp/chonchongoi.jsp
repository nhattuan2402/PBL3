<%@page import="java.util.ArrayList"%>
<%@page import="model.*"%>
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
<script src="./assets/events/formchonchongoi.js"></script>
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>
</head>
<body>

	<jsp:include page="/header.jsp"></jsp:include>

	<div class="container-fluid">
		<form action="<%=url%>/khach-hang-controller" method="post"
			name="chonGheNgoi">
			<input type="hidden" name="hanhDong" value="chon-cho-ngoi">
			<div class="row">
				<%
				String loaiVe = session.getAttribute("loaiVe").toString();
				int soHK = Integer.parseInt(session.getAttribute("soHK").toString());

				ChuyenBay chuyenBayDiDuocChon = (ChuyenBay) session.getAttribute("chuyenBayDiDuocChon");
				TuyenBay tuyenBayDi = (TuyenBay) session.getAttribute("tuyenBayDi");
				Object cbvdc = session.getAttribute("chuyenBayVeDuocChon");
				Object tbvdc = session.getAttribute("tuyenBayVe");

				ChuyenBay chuyenBayVeDuocChon = null;
				if (cbvdc != null) {
					chuyenBayVeDuocChon = (ChuyenBay) cbvdc;
				}

				String tongTien = session.getAttribute("tongTien") + "";

				ArrayList<String> tenHK = (ArrayList<String>) session.getAttribute("tenHK");
				%>
				<div class="matran  col-xs-12  col-md-6" id="maybay__chuyendi">
					<div class="maTranViTriChoNgoi " id="maTranViTriChoNgoicd">
						<script>
							var maTranHtml = taoMaTranChoNgoichuyendiA32X(8, 4,
									46, 81, 75, 6); //a321 (có ba bản) a320
						</script>
					</div>
				</div>

				<%
				if (loaiVe.equals("Khứ hồi")) {
				%>
				<div class="matran hidden col-xs-12  col-md-6" id="maybay__chuyenve">
					<div class="maTranViTriChoNgoi " id="maTranViTriChoNgoicv">
						<script>
							var maTranHtml = taoMaTranChoNgoichuyenveA32X(16,
									4, 24, 77, 65, 6);
						</script>
					</div>
				</div>
				<%
				}
				%>

				<div class="thongTinChoNgoi col-xs-12  col-md-6">
					<div class="row">
						<div class="thongTinChoNgoi__thongtinhanhtrinh">
							<div class="thongTinChoNgoi__thongtinhanhtrinh-thanhphan">
								<div
									class="thongTinChoNgoi__thongtinhanhtrinh-thanhphan-thongtin">
									<div class="desc--boxThongtin thongTinChoNgoi-tieude"
										id="thongTinChoNgoi__ThanhPhoDi">
										<%=tuyenBayDi.getNoiCatCanh()%>
									</div>
									<div class=" move-top-label">Việt Nam</div>
								</div>
								<div
									class="thongTinChoNgoi__thongtinhanhtrinh-thanhphan-thongtin"
									id="thongTinChoNgoi__ThanhPhoVe">
									<div class="iconthongtinhanhtrinh">
										<i class="fa-solid fa-arrow-right"></i>
									</div>
									<div class="iconthongtinhanhtrinh  thongtinhanhtrinhchuyenve">
										<i class="fa-solid fa-arrow-right fa-rotate-180"></i>
									</div>
								</div>
								<div
									class="thongTinChoNgoi__thongtinhanhtrinh-thanhphan-thongtin">
									<div class="desc--boxThongtin thongTinChoNgoi-tieude">
										<%=tuyenBayDi.getNoiHaCanh()%>
									</div>
									<div class="move-top-label">Việt Nam</div>
								</div>
							</div>

							<div
								class="thongTinChoNgoi__thongtinhanhtrinh-thanhphan chuyenbaydangchon"
								id="chuyenbaydi--tieude">
								<div
									class="thongTinChoNgoi__thongtinhanhtrinh-thanhphan-thongtin thongTinChoNgoi--ngaybay ">
									<div class="thongTinChoNgoi__LichBay">
										<div class="thongTinChoNgoi__LichBay-NgayBay"><%=chuyenBayDiDuocChon.getNgayBay()%></div>
										<div class="thongTinChoNgoi__LichBay-GioBay"><%=chuyenBayDiDuocChon.getGioBay()%></div>
									</div>
									<div class="move-top-label">Chuyến Đi</div>
								</div>
							</div>
							<%
							if (chuyenBayVeDuocChon != null) {
							%>
							<div class="thongTinChoNgoi__thongtinhanhtrinh-thanhphan "
								id="chuyenbayve--tieude">
								<div
									class="thongTinChoNgoi__thongtinhanhtrinh-thanhphan-thongtin">
									<div class="thongTinChoNgoi__LichBay">
										<div class="thongTinChoNgoi__LichBay-NgayBay"><%=chuyenBayVeDuocChon.getNgayBay()%></div>
										<div class="thongTinChoNgoi__LichBay-GioBay"><%=chuyenBayVeDuocChon.getGioBay()%></div>
									</div>
									<div class="move-top-label">Chuyến Về</div>
								</div>
							</div>
							<%
							}
							%>
						</div>
					</div>
					<div class="row thongTinChoNgoi--loaighe ">
						<div class="row col-xs-6  col-md-6 thongTinChoNgoi--loaiphothong">
							<img src="./assets/images/chonchongoi__ghephoThong.png"
								alt="GhePhoThong" class="img-responsive">
							<div class="thongTinChoNgoi__mota">
								<div class="chonloaighe">
									<div class="title thongTinChoNgoi__mota--title ">Phổ
										thông (300.000VND)</div>
									<div class=" bandachonloaighe" id="chonloaighephothong">Đã
										Chọn</div>
								</div>
								<div class="desc desc--thongTinChoNgoi__mota">Nghỉ ngơi và
									nạp năng lượng trong suốt chuyến bay của bạn với chỗ để chân mở
									rộng, dịch vụ cá nhân hóa và dịch vụ bữa ăn nhiều món</div>
								<div class="phancach"></div>
								<div class="thongTinChoNgoi__mota-chitiet">
									<ul class="thongTinChoNgoi__mota-DanhSachUuDai">
										<li class="thongTinChoNgoi__mota-DanhSachUuDai-thanhphan">Tích
											hợp hệ thống giải trí</li>
										<li class="thongTinChoNgoi__mota-DanhSachUuDai-thanhphan">Đồ
											ăn nhẹ và đồ uống miễn phí</li>
										<li class="thongTinChoNgoi__mota-DanhSachUuDai-thanhphan">Một
											hành lý xách tay và vật dụng cá nhân miễn phí</li>
									</ul>
								</div>
							</div>

						</div>
						<div class="row col-xs-6  col-md-6 thongTinChoNgoi--loaithuonggia">
							<img src="./assets/images/chonchongoi__ghethuonggia.png"
								alt="GhePhoThong" class="img-responsive">
							<div
								class="thongTinChoNgoi__mota thongTinChoNgoi__mota--thuonggia">
								<div class="chonloaighe">
									<div class="title thongTinChoNgoi__mota--title ">Thương
										Gia (500.000VND)</div>
									<div class=" bandachonloaighe" id="chonloaighethonggia">Đã
										Chọn</div>
								</div>
								<div class="desc desc--thongTinChoNgoi__mota">Nghỉ ngơi và
									nạp năng lượng trong suốt chuyến bay của bạn với chỗ để chân mở
									rộng, dịch vụ cá nhân hóa và dịch vụ bữa ăn nhiều món</div>
								<div class="phancach phancach--thuonggia"></div>
								<div class="thongTinChoNgoi__mota-chitiet">
									<ul
										class="thongTinChoNgoi__mota-DanhSachUuDai thongTinChoNgoi__mota-DanhSachUuDai--thuonggia ">
										<li class="thongTinChoNgoi__mota-DanhSachUuDai-thanhphan">Chỗ
											để chân mở rộng</li>
										<li class="thongTinChoNgoi__mota-DanhSachUuDai-thanhphan">Hai
											túi ký gửi đầu tiên miễn phí</li>
										<li class="thongTinChoNgoi__mota-DanhSachUuDai-thanhphan">Ưu
											tiên lên máy bay</li>
										<li class="thongTinChoNgoi__mota-DanhSachUuDai-thanhphan">Dịch
											vụ cá nhân hóa</li>
										<li class="thongTinChoNgoi__mota-DanhSachUuDai-thanhphan">Tăng
											cường dịch vụ ăn uống</li>
										<li class="thongTinChoNgoi__mota-DanhSachUuDai-thanhphan">Ghế
											ngả nhiều hơn 40% so với hạng phổ thông</li>
									</ul>
								</div>
							</div>
						</div>
					</div>


					<div class="row thongtinchuyendixacnhan">
						<%
						for (int i = 1; i <= soHK; i++) {
						%>
						<input type="hidden" id="maSoGhe--chuyendiHK<%=i%>"
							name="maGheDi<%=i%>"> <input type="hidden"
							id="maSoGhe--chuyenveHK<%=i%>" name="maGheVe<%=i%>">
						<%
						if (i == 1) {
						%>
						<div class=" thongTinChoNgoi__thanhchuyentiep chuyendi"
							id="chuyendiHK<%=i%>">
							<div class="thongTinChoNgoi__thongtinxacnhan">
								<div class="thongTinChoNgoi__thongtinxacnhan-title">
									Hành khách
									<%=i%></div>
								<div class="thongTinChoNgoi__thongtinxacnhan-ChiTiet"><%=tenHK.get(i - 1)%></div>
							</div>
							<div class="thongTinChoNgoi__thongtinxacnhan">
								<div class="thongTinChoNgoi__thongtinxacnhan-title">Mã Số
									Ghế</div>
								<div class="thongTinChoNgoi__thongtinxacnhan-ChiTiet "
									id='MaSoGhechuyendiHK<%=i%>'>--</div>
							</div>
						</div>
						<%
						} else {
						%>
						<div class=" thongTinChoNgoi__thanhchuyentiep chuyendi hidden"
							id="chuyendiHK<%=i%>">
							<div class="thongTinChoNgoi__thongtinxacnhan">
								<div class="thongTinChoNgoi__thongtinxacnhan-title">
									Hành khách
									<%=i%></div>
								<div class="thongTinChoNgoi__thongtinxacnhan-ChiTiet"><%=tenHK.get(i - 1)%></div>
							</div>
							<div class="thongTinChoNgoi__thongtinxacnhan">
								<div class="thongTinChoNgoi__thongtinxacnhan-title">Mã Số
									Ghế</div>
								<div class="thongTinChoNgoi__thongtinxacnhan-ChiTiet "
									id='MaSoGhechuyendiHK<%=i%>'>--</div>
							</div>
						</div>
						<%
						}
						%>
						<div class=" thongTinChoNgoi__thanhchuyentiep hidden"
							id="chuyenveHK<%=i%>">
							<div class="thongTinChoNgoi__thongtinxacnhan">
								<div class="thongTinChoNgoi__thongtinxacnhan-title">
									Hành khách
									<%=i%></div>
								<div class="thongTinChoNgoi__thongtinxacnhan-ChiTiet"><%=tenHK.get(i - 1)%></div>
							</div>
							<div class="thongTinChoNgoi__thongtinxacnhan">
								<div class="thongTinChoNgoi__thongtinxacnhan-title">Mã Số
									Ghế</div>
								<div class="thongTinChoNgoi__thongtinxacnhan-ChiTiet"
									id="MaSoGhechuyenveHK<%=i%>">--</div>
							</div>
						</div>

						<%
						}
						%>
						<button type="button" class="_btnQuayLai btn--chonngoi"
							onclick="return quayLaiChonChoNgoi()">Quay Lại</button>
						<button type="submit" class="_btnChuyenTiep  btn--chonngoi"
							onclick="return chuyenTiepChonChoNgoi()">Tiếp Theo</button>
					</div>
				</div>
			</div>
		</form>
	</div>
	
	<jsp:include page="/footer.jsp"></jsp:include>
	
</body>