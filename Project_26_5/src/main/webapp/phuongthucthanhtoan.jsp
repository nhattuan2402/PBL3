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
<link rel="stylesheet" href="./assets/style/phuongthucthanhtoan.css" />

<script src="./assets/events/event_index.js"></script>
<script src="./assets/events/phuongthucthanhtoan.js"></script>

<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>
</head>
<body>
	
	<jsp:include page="/header.jsp"></jsp:include>
	
	<div class=" trangchonphuongthucthanhtoan">
		<div class="container">
			<!-- Modal -->
			<%
				String tongTienCuoi = session.getAttribute("tongTienCuoiCung").toString();
			%>
			<form action="<%=url%>/khach-hang-controller" action="post">
				<input type="hidden" name="hanhDong" value="thanh-toan">
				<div class="modal fade" id="thanhtoanModal" tabindex="-1"
					role="dialog" aria-labelledby="exampleModalLabel"
					aria-hidden="true">
					<div class="modal-dialog " role="document">
						<div class="modal-content">
							<div class="modal-header backgroud__modal__brandcolor">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<div class="title__modalchitietthanhtoan">Thông Tin Thanh
									Toán</div>
							</div>
							<div class="modal-body">
								<div class="thongtinthanhtoan">
									<div class="thongtinthanhtoannganhang">
										<div class="tennganhangthanhtoan">VNPAY QR</div>
										<img src="./assets/images/vnpay.png" alt="qrthanhtoan"
											class="img__thanhtoan">
									</div>
									<div>
										<div class="chitietthanhtoan__title">Chi Tiết Thanh Toán
										</div>
										<div class="noidungchitietthanhtoan">
											<div class="thitietthianhtoan__dong">
												<div class="tieudemuc">Tạm tính</div>
												<div class="noidungmuc">
													<span class="tongtientamtinh1"><%=tongTienCuoi %></span>,000VND
												</div>
											</div>
											<div class="thitietthianhtoan__dong">
												<div class="tieudemuc">Mã Khuyến mãi</div>
												<div class="noidungmuc">
													<span class="tongtienmakhuyenmai">0</span>,000VND
												</div>
											</div>
											<div class="thitietthianhtoan__dong dongtongtien">
												<div class="tieudemuc">Tổng tiền</div>
												<div class="noidungmuc">
													<span class="tongtiencanthanhtoan"><%=tongTienCuoi %></span>,000VND
												</div>
											</div>
											<input type = "hidden" id="tienthanhtoan" name ="tienthanhtoan" value="0">
											<input type = "hidden" id="tienkhuyenmai" name = "tienkhuyenmai" value="0">
										</div>
									</div>
								</div>
								<div class="thongtinnganhang">
									<div class="motacachgiaodich">Scan QR code via Bank/
										E-wallet app</div>
									<img
										src="https://thumbs.dreamstime.com/b/scan-qr-code-smartphone-screen-d-scanning-barcode-concept-qr-pay-isometric-vector-illustration-electronic-online-scan-qr-code-206044891.jpg"
										alt="anhQR" class="anhqrthanhtoan">
									<button type="button" class="cancel__thanhtoan"
										data-dismiss="modal">Cancel</button>
								</div>
							</div>
							<div
								class="modal-footer backgroud__modal__brandcolor thongtinthanhtoan">
								<button type="submit" class="btn btn-primary btnmodal">Đi
									Tiếp</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			<div class="row">
				<div class="thongTinHanhKhach__tieuDe col-xs-12  col-md-9 ">
					<div class="title title--thongTinHanhKhach">Phương thức thanh
						toán</div>
					<div class="desc desc--thongtinhanhkhach"
						style="margin-left: 0rem;">chọn phương thức thanh toán bên
						dưới.</div>
				</div>
				<!-- phuong thuc thanh toan-->
				<div class="thongTinHanhKhach col-xs-12  col-md-8 ">
					<ul class="phuongthucthanhtoan">
						<li class="phuongthuc select__phuongthuc" value="1"><img
							src="./assets/images/vnpay-qr-23-06-2020-2.jpg" alt="qrthanhtoan"
							class="img__thanhtoan ">
							<div class="tenphuongtuc">Quét mã QR VNPAY</div></li>
					</ul>
					<div class="chitietthanhtoan col-xs-12  col-md-9">
						<div class="chitietthanhtoan__title">Chi Tiết Thanh Toán</div>
						<div class="noidungchitietthanhtoan">
							<div class="thitietthianhtoan__dong">
								<div class="tieudemuc">Tạm tính</div>
								<div class="noidungmuc">
									<span class="tongtientamtinh"><%=tongTienCuoi %></span>,000VND
								</div>
							</div>
							<div class="thitietthianhtoan__dong">
								<div class="tieudemuc">Mã Khuyến mãi</div>
								<div class="noidungmuc">
									<span class="tongtienmakhuyenmai">0</span>,000VND
								</div>
							</div>
							<div class="thitietthianhtoan__dong dongtongtien">
								<div class="tieudemuc">Tổng tiền</div>
								<div class="noidungmuc">
									<span class="tongtiencanthanhtoan"><%=tongTienCuoi %></span>,000VND
								</div>
							</div>
						</div>
						<div class="box_makhuyenmai">
							<div class="box__checksudungma">
								<input type="checkbox" id="sudungmaquatang"
									value="sudungmaquatang">
								<div class="makhuyenmai">Mã khuyến mãi hoặc quà tặng</div>
							</div>
							<form action="">
								<div class="magiamgia" id="magiamgia">
									<input type="text" class="input__mathanhtoan"
										placeholder="Mã khuyến mãi?" value="">
									<button type="button" class="btnSubmit__magiamgia">Xác
										nhận</button>
								</div>
							</form>
						</div>
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
				<div class="col-xs-12  col-md-4 trangDienThongTin">
					<div class="chyenbayduocchon ">
						<div
							class="chyenbayduocchon__chuyenbay trangDienThongTinHanhKhach__muavemaybay background-white pulse  box-shadow-blackcolor"
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
							class="chyenbayduocchon__chuyenbay trangDienThongTinHanhKhach__muavemaybay background-white pulse  box-shadow-blackcolor"
							id="chuyenbayduocchon__chuyendi-DienThongTinHK">
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
			<input type="hidden" class="hidden" id="input_phuongthuc" value="1">
			<div class="thanhdieuhuong__phuongthucthanhtoan row">
				<button type="button" class="_btnQuayLai btn__vuong">Quaylai</button>
				<button type="submit" class="_btnChuyenTiep btn__vuong"
					data-toggle="modal" data-target="#thanhtoanModal">Xác nhận
					thanh toán</button>
			</div>
		</div>
	</div>

	<jsp:include page="/footer.jsp"></jsp:include>
</body>