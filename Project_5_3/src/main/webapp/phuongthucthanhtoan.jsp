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

</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-xs-12  col-md-7">
				<div class="thongTinHanhKhach__tieuDe row col-xs-12  col-md-12 ">
					<div class="title title--thongTinHanhKhach row">Thông tin
						thanh toán</div>
					<div class="desc desc--thongtinhanhkhach">Chọn phương thức
						thanh toán bên dưới.</div>
				</div>
			</div>

			<%
			ChuyenBay chuyenBayDiDuocChon = (ChuyenBay) session.getAttribute("chuyenBayDiDuocChon");
			TuyenBay tuyenBayDi = (TuyenBay) session.getAttribute("tuyenBayDi");
			Object cbvdc = session.getAttribute("chuyenBayVeDuocChon");
			Object tbvdc = session.getAttribute("tuyenBayVe");

			ChuyenBay chuyenBayVeDuocChon = null;
			if (cbvdc != null) {
				chuyenBayVeDuocChon = (ChuyenBay) cbvdc;
			}

			TuyenBay tuyenBayVe = null;
			if (tbvdc != null) {
				tuyenBayVe = (TuyenBay) tbvdc;
			}

			String tongTien = session.getAttribute("tongTien") + "";
			%>

			<!-- box chuyen bay được chọn-->
			<div class="col-xs-12  col-md-5 trangDienThongTin">
				<div class="chyenbayduocchon ">
					<div
						class="chyenbayduocchon__chuyenbay trangDienThongTinHanhKhach__muavemaybay"
						id="chuyenbayduocchon__chuyendi-DienThongTinHK">
						<div class="chyenbayduocchon__title">Chuyến Đi</div>
						<div class="chyenbayduocchon__chitietchuyenbay">
							<div class="chyenbayduocchon__item">
								<div class="chyenbayduocchon__item__part">
									<span class="required" id="chuyendi__macb"><%=chuyenBayDiDuocChon.getMaChuyenBay()%></span>
								</div>
								<div
									class="chyenbayduocchon__item__part chyenbayduocchon__item__part--text-align-right">
									<span class="chyenbayduocchon-thongtin" id="chuyendi__ngaybay"><%=chuyenBayDiDuocChon.getNgayBay()%>
									</span> <br> <span class="chyenbayduocchon-thongtin"
										id="chuyendi__giobay"><%=tuyenBayDi.getThoiGianBay()%>h</span>
									<br> <span class="chyenbayduocchon-thongtin"
										id="chuyendi__lichbay"><%=chuyenBayDiDuocChon.getGioBay()%></span>
									<br> <span class="chyenbayduocchon-thongtin color-grey"
										id="chuyendi__hanhtrinhbay"><%=tuyenBayDi.getNoiCatCanh()%>
										Đến <%=tuyenBayDi.getNoiHaCanh()%></span>
								</div>
							</div>
							<div class="chyenbayduocchon__item">
								<div class="chyenbayduocchon__item__part"></div>
								<div class="chyenbayduocchon__item__part">
									<div class="thongtinchitietgiave-item">
										<div class="thongtinchitietgiave-title">Giá vé :</div>
										<div class="thongtinchitietgave-giave">
											<span id="chuyendi__giave"><%=chuyenBayDiDuocChon.getGia()%></span>.000VND
										</div>
									</div>
									<div class="thongtinchitietgiave-item">
										<div class="thongtinchitietgiave-title">Thuế :</div>
										<div class="thongtinchitietgave-giave">
											<span id="chuyendi__thue"><%=(int) (chuyenBayDiDuocChon.getGia() * 0.1)%></span>.000VND
										</div>
									</div>
									<div class="thongtinchitietgiave-item">
										<div class="thongtinchitietgiave-title">Tổng :</div>
										<div class="thongtinchitietgave-giave">
											<span id="chuyendi__tongtien"><%=(int) (chuyenBayDiDuocChon.getGia() * 1.1)%></span>.000VND
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<br> <br>
					<%
					if (chuyenBayVeDuocChon != null && tuyenBayVe != null) {
					%>
					<div
						class="chyenbayduocchon__chuyenbay  trangDienThongTinHanhKhach__muavemaybay"
						id="chuyenbayduocchon__chuyenve-DienThongTinHK">
						<div class="chyenbayduocchon__title">Chuyến Về</div>
						<div class="chyenbayduocchon__chitietchuyenbay">
							<div class="chyenbayduocchon__item">
								<div class="chyenbayduocchon__item__part">
									<span class="required" id="chuyenve__macb"> <%=chuyenBayVeDuocChon.getMaChuyenBay()%></span>
								</div>
								<div
									class="chyenbayduocchon__item__part chyenbayduocchon__item__part--text-align-right">
									<span class="chyenbayduocchon-thongtin" id="chuyenve__ngaybay"><%=chuyenBayVeDuocChon.getNgayBay()%></span>
									<br> <span class="chyenbayduocchon-thongtin"
										id="chuyenve__giobay"><%=tuyenBayVe.getThoiGianBay()%>h</span>
									<br> <span class="chyenbayduocchon-thongtin"
										id="chuyenve__lichbay"><%=chuyenBayVeDuocChon.getGioBay()%></span>
									<br> <span class="chyenbayduocchon-thongtin color-grey"
										id="chuyenve__hanhtrinhbay"><%=tuyenBayVe.getNoiCatCanh()%>
										Đến <%=tuyenBayVe.getNoiHaCanh()%></span>
								</div>
							</div>
							<div class="chyenbayduocchon__item">
								<div class="chyenbayduocchon__item__part"></div>
								<div class="chyenbayduocchon__item__part">
									<div class="thongtinchitietgiave-item">
										<div class="thongtinchitietgiave-title">Giá vé :</div>
										<div class="thongtinchitietgave-giave">
											<span id="chuyenve__giave"><%=chuyenBayVeDuocChon.getGia()%></span>.000VND
										</div>
									</div>
									<div class="thongtinchitietgiave-item">
										<div class="thongtinchitietgiave-title">Thuế :</div>
										<div class="thongtinchitietgave-giave">
											<span id="chuyenve__thue"><%=(int) (chuyenBayVeDuocChon.getGia() * 0.1)%></span>.000VND
										</div>
									</div>
									<div class="thongtinchitietgiave-item">
										<div class="thongtinchitietgiave-title">Tổng :</div>
										<div class="thongtinchitietgave-giave">
											<span id="chuyenve__tongtien"><%=(int) (chuyenBayVeDuocChon.getGia() * 1.1)%></span>.000VND
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</div>
	</div>


</body>