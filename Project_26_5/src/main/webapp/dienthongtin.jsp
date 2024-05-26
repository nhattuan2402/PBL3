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

<script src="./assets/events/event_index.js"></script>
<script src="./assets/events/formDienThongTinHanhKhach.js"></script>

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

	<jsp:include page="/header.jsp"></jsp:include>

	<form action="<%=url%>/khach-hang-controller"
		name="DienThongTinHanhKhach" method="post">
		<input type="hidden" name="hanhDong" value="dien-thong-tin" />
		<div class="trangDienThongTin row">
			<div class="container">
				<div class="row">
					<div class="thongTinHanhKhach__tieuDe row col-xs-12  col-md-7 ">
						<div class="title title--thongTinHanhKhach row">Thông tin
							hành khách</div>
						<div class="desc desc--thongtinhanhkhach">Nhập thông tin cần
							thiết cho mỗi hành khách và đảm bảo rằng thông tin đó khớp chính
							xác với ID do chính phủ cấp được xuất trình tại sân bay.</div>
					</div>
					<%
						int soNguoiLon=0;
		                Object soNguoiLonObj = session.getAttribute("soNguoiLon");
		                if (soNguoiLonObj != null) {
		                	soNguoiLon = Integer.parseInt(soNguoiLonObj.toString());
		                }
		                
		                int soTreEm=0;
		                Object soTreEmObj = session.getAttribute("soTreEm");
		                if (soTreEmObj != null) {
		                	soTreEm = Integer.parseInt(soTreEmObj.toString());
		                }
					%>
					<div class="thongTinHanhKhach col-xs-12  col-md-7 ">
						<%for(int i=1;i<=soNguoiLon;i++) { %>
						<div class="thongTinHanhKhach__BoxDienThongTin"
							id="box-dienThongTinNguoiLon">
							<div class="desc desc--boxThongtin">
								Hành khách <span id="stt-HanhKhach__dienthongtinHK"><%=i%></span>
								(Người lớn)
							</div>
							<div class="thanhNhapThongTin thanhNhapThongTin--row0">
								<div class="boxnhapthongtinHK">
									<input type="text"
										class="theInput form-control hovaten__nhapthongtinHK"
										id="hovaten__nhapthongtinHKNL<%=i%>" placeholder="Họ Và Tên*"
										name="tenNguoiLon<%=i%>" />
									<div class="warning"></div>
								</div>
								<div class="boxnhapthongtinHK">
									<input type="date" class="theInput form-control"
										id="ngaySinh__nhapthongtinHKNL<%=i %>"
										placeholder="Ngày sinh*" name="ngaySinhNguoiLon<%=i%>" />
									<div class="warning"></div>
									<div class="boxmota">
										<div class="desc desc--moTaNgaySinh">DD/MM/YY Ví
											Dụ:25/5/1982</div>
									</div>
								</div>
							</div>
							<div class="thanhNhapThongTin thanhNhapThongTin--row1">
								<div class="boxnhapthongtinHK">
									<input type="text" class="theInput form-control"
										id="email__nhapthongtinHKNL<%=i %>" placeholder="Email*"
										name="emailNguoiLon<%=i%>" />
									<div class="warning"></div>
								</div>
								<div class="boxnhapthongtinHK">
									<input type="text" class="theInput form-control"
										id="SDT__nhapthongtinHKNL<%=i %>" placeholder="Số Điện Thoại*"
										name="sdtNguoiLon<%=i%>" />
									<div class="warning"></div>
								</div>
							</div>
							<div class="thanhNhapThongTin">
								<div class="boxnhapthongtinHK">
									<input type="text" class="theInput form-control"
										id="DiaChi__nhapthongtinHKNL<%=i %>" placeholder="Địa Chỉ"
										name="diaChiNguoiLon<%=i%>" />
									<div class="warning"></div>
								</div>
								<div class="boxnhapthongtinHK">
									<input type="text" class="theInput form-control"
										id="QuocTich__nhapthongtinHKNL<%=i %>" placeholder="Quốc Tịch"
										name="quocTichNguoiLon<%=i%>" />
									<div class="warning"></div>
								</div>
							</div>
							<div class="thanhNhapThongTin">
								<div class="boxnhapthongtinHK">
									<input type="text" class="theInput form-control"
										id='GioiTinh__nhapthongtinHKNL<%=i %>' placeholder="Giới Tính"
										name="gioiTinhNguoiLon<%= i%>" />
									<div class="warning"></div>
									<div class="boxmota">
										<div class="desc desc--moTaNgaySinh">Nam/Nữ Ví Dụ: Nam</div>
									</div>
								</div>
								<div class="boxnhapthongtinHK">
									<input type="text" class="theInput form-control"
										id="CCCD__nhapthongtinHKNL<%=i %>" placeholder="CCCD/CMND"
										name="cccdNguoiLon<%=i%>" />
									<div class="warning"></div>
								</div>
							</div>
						</div>
						<%} %>
						<%for(int i=1;i<=soTreEm;i++){ %>
						<div class="thongTinHanhKhach__BoxDienThongTin"
							id="box-dienThongTinTreEm">
							<div class="desc desc--boxThongtin">
								Hành khách <span id="stt-HanhKhach__dienthongtinHK"><%=i%></span>
								(Trẻ em)
							</div>
							<div class="thanhNhapThongTin thanhNhapThongTin--row0">
								<div class="boxnhapthongtinHK">
									<input type="text"
										class="theInput form-control hovaten__nhapthongtinHK "
										id="hovaten__nhapthongtinHKTE<%=i%>" placeholder="Họ Và Tên*"
										name="tenTreEm<%=i%>" />
									<div class="warning"></div>
								</div>
								<div class="boxnhapthongtinHK">
									<input type="date" class="theInput form-control"
										id="ngaySinh__nhapthongtinHKTE<%=i %>"
										placeholder="Ngày sinh*" name="ngaySinhTreEm<%=i%>" />
									<div class="warning"></div>
									<div class="boxmota">
										<div class="desc desc--moTaNgaySinh">DD/MM/YY Ví
											Dụ:25/5/1982</div>
									</div>
								</div>
							</div>
							<div class="thanhNhapThongTin thanhNhapThongTin--row1">
								<div class="boxnhapthongtinHK">
									<input type="text" class="theInput form-control"
										id="DiaChi__nhapthongtinHKTE<%=i %>" placeholder="Địa Chỉ"
										name="diaChiTreEm<%=i%>" />
									<div class="warning"></div>
								</div>
								<div class="boxnhapthongtinHK">
									<input type="text" class="theInput form-control"
										id="QuocTich__nhapthongtinHKTE<%=i %>" placeholder="Quốc Tịch"
										name="quocTichTreEm<%=i%>" />
									<div class="warning"></div>
								</div>
							</div>
							<div class="thanhNhapThongTin">
								<div class="boxnhapthongtinHK">
									<input type="text" class="theInput form-control"
										id="GioiTinh__nhapthongtinHKTE<%=i %>" placeholder="Giới Tính"
										name="gioiTinhTreEm<%=i%>" />
									<div class="warning"></div>
									<div class="boxmota">
										<div class="desc desc--moTaNgaySinh">Nam/Nữ Ví Dụ: Nam</div>
									</div>
								</div>
							</div>
						</div>
						<%} %>
					</div>

					<%
						ChuyenBay chuyenBayDiDuocChon = (ChuyenBay) session.getAttribute("chuyenBayDiDuocChon");
						TuyenBay tuyenBayDi = (TuyenBay)session.getAttribute("tuyenBayDi");
						Object cbvdc = session.getAttribute("chuyenBayVeDuocChon");
						Object tbvdc = session.getAttribute("tuyenBayVe");
						
						ChuyenBay chuyenBayVeDuocChon = null;
						if(cbvdc !=null) {
							chuyenBayVeDuocChon = (ChuyenBay) cbvdc;
						}
						
						TuyenBay tuyenBayVe = null;
						if(tbvdc!=null) {
							tuyenBayVe = (TuyenBay) tbvdc;
						}
						
						String tongTien = session.getAttribute("tongTien")+"";
						
					%>
					<!-- box chuyen bay được chọn-->
					<div class="col-xs-12  col-md-4 trangDienThongTin">
						<div class="chyenbayduocchon ">
							<div
								class="chyenbayduocchon__chuyenbay trangDienThongTinHanhKhach__muavemaybay"
								id="chuyenbayduocchon__chuyendi-DienThongTinHK">
								<div class="chyenbayduocchon__title">Chuyến Đi</div>
								<div class="chyenbayduocchon__chitietchuyenbay">
									<div class="chyenbayduocchon__item">
										<div class="chyenbayduocchon__item__part">
											<span class="required" id="chuyendi__macb"><%=chuyenBayDiDuocChon.getMaChuyenBay() %></span>
										</div>
										<div
											class="chyenbayduocchon__item__part chyenbayduocchon__item__part--text-align-right">
											<span class="chyenbayduocchon-thongtin"
												id="chuyendi__ngaybay"><%=chuyenBayDiDuocChon.getNgayBay() %>
											</span> <br> <span class="chyenbayduocchon-thongtin"
												id="chuyendi__giobay"><%=tuyenBayDi.getThoiGianBay() %>h</span>
											<br> <span class="chyenbayduocchon-thongtin"
												id="chuyendi__lichbay"><%=chuyenBayDiDuocChon.getGioBay() %></span>
											<br> <span class="chyenbayduocchon-thongtin color-grey"
												id="chuyendi__hanhtrinhbay"><%=tuyenBayDi.getNoiCatCanh() %>
												Đến <%=tuyenBayDi.getNoiHaCanh() %></span>
										</div>
									</div>
									<div class="chyenbayduocchon__item">
										<div class="chyenbayduocchon__item__part"></div>
										<div class="chyenbayduocchon__item__part">
											<div class="thongtinchitietgiave-item">
												<div class="thongtinchitietgiave-title">Giá vé :</div>
												<div class="thongtinchitietgave-giave">
													<span id="chuyendi__giave"><%=chuyenBayDiDuocChon.getGia() %></span>.000VND
												</div>
											</div>
											<div class="thongtinchitietgiave-item">
												<div class="thongtinchitietgiave-title">Thuế :</div>
												<div class="thongtinchitietgave-giave">
													<span id="chuyendi__thue"><%=(int)(chuyenBayDiDuocChon.getGia()*0.1)%></span>.000VND
												</div>
											</div>
											<div class="thongtinchitietgiave-item">
												<div class="thongtinchitietgiave-title">Tổng :</div>
												<div class="thongtinchitietgave-giave">
													<span id="chuyendi__tongtien"><%=(int)(chuyenBayDiDuocChon.getGia()*1.1)%></span>.000VND
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<br> <br>
							<%
								if(chuyenBayVeDuocChon!=null && tuyenBayVe != null) {
							%>
							<div
								class="chyenbayduocchon__chuyenbay  trangDienThongTinHanhKhach__muavemaybay"
								id="chuyenbayduocchon__chuyenve-DienThongTinHK">
								<div class="chyenbayduocchon__title">Chuyến Về</div>
								<div class="chyenbayduocchon__chitietchuyenbay">
									<div class="chyenbayduocchon__item">
										<div class="chyenbayduocchon__item__part">
											<span class="required" id="chuyenve__macb"> <%=chuyenBayVeDuocChon.getMaChuyenBay() %></span>
										</div>
										<div
											class="chyenbayduocchon__item__part chyenbayduocchon__item__part--text-align-right">
											<span class="chyenbayduocchon-thongtin"
												id="chuyenve__ngaybay"><%=chuyenBayVeDuocChon.getNgayBay() %></span>
											<br> <span class="chyenbayduocchon-thongtin"
												id="chuyenve__giobay"><%=tuyenBayVe.getThoiGianBay() %>h</span>
											<br> <span class="chyenbayduocchon-thongtin"
												id="chuyenve__lichbay"><%=chuyenBayVeDuocChon.getGioBay() %></span>
											<br> <span class="chyenbayduocchon-thongtin color-grey"
												id="chuyenve__hanhtrinhbay"><%=tuyenBayVe.getNoiCatCanh() %>
												Đến <%=tuyenBayVe.getNoiHaCanh() %></span>
										</div>
									</div>
									<div class="chyenbayduocchon__item">
										<div class="chyenbayduocchon__item__part"></div>
										<div class="chyenbayduocchon__item__part">
											<div class="thongtinchitietgiave-item">
												<div class="thongtinchitietgiave-title">Giá vé :</div>
												<div class="thongtinchitietgave-giave">
													<span id="chuyenve__giave"><%=chuyenBayVeDuocChon.getGia() %></span>.000VND
												</div>
											</div>
											<div class="thongtinchitietgiave-item">
												<div class="thongtinchitietgiave-title">Thuế :</div>
												<div class="thongtinchitietgave-giave">
													<span id="chuyenve__thue"><%=(int)(chuyenBayVeDuocChon.getGia()*0.1)%></span>.000VND
												</div>
											</div>
											<div class="thongtinchitietgiave-item">
												<div class="thongtinchitietgiave-title">Tổng :</div>
												<div class="thongtinchitietgave-giave">
													<span id="chuyenve__tongtien"><%=(int)(chuyenBayVeDuocChon.getGia()*1.1)%></span>.000VND
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<%} %>
						</div>
					</div>

					<!--/. kết thuc  box chuyen bay được chọn-->

				</div>

				<!-- nhập thông tin khach hàng - nhập số hành lý ký gửi -->
				<div class="row">
					<div class="thongTinHanhKhach__tieuDe row  row col-xs-12  col-md-7">
						<div class="desc desc--thongtinhanhkhach desc--boxThongtin">Thông
							tin hành lý</div>
						<div class="desc desc--thongtinhanhkhach">Mỗi hành khách
							được phép mang theo một túi xách tay miễn phí và một vật dụng cá
							nhân. Hành lý ký gửi đầu tiên cho mỗi hành khách cũng được miễn
							phí. Với mỗi 5kg hành lý thêm, quý khách sẽ phải trả 100.000VND.</div>

						<div class="thongTinHanhKhach__chiTietKyGui">
							<div class="chiTietKyGui__ThanhPhan desc--thongtinhanhkhach">
								<div class="chiTietKyGui__ThanhPhan-TenHanhKhach">Hành
									khách</div>
								<div class="chiTietKyGui__ThanhPhan-HanhLyKyGui">Khối
									lượng ký gửi</div>
							</div>
							<%for(int i=1;i<=soNguoiLon;i++ ){%>
							<div
								class="chiTietKyGui__ThanhPhan desc--thongtinhanhkhach desc--boxThongtin">
								<div class="chiTietKyGui__ThanhPhan-TenHanhKhach"
									id='tenHK__nhapthongtinHKNL<%=i%>'>----</div>
								<div class="chiTietKyGui__ThanhPhan-HanhLyKyGui">
									<button type="button"
										class="HanhLyKyGui--thanhphan  btn__GiamKhoiLuongKyGui">-</button>
									<div class="HanhLyKyGui--thanhphan">0</div>

									<button type="button"
										class="HanhLyKyGui--thanhphan btn__TangKhoiLuongKyGui">+</button>
									<input type="hidden" class="KhoiLuongKyGui"
										id="chiTietKyGui-SoLuongHanhKyGuiHKNL<%=i%>"
										name="KLHLNguoiLon<%=i%>" value="1">
								</div>
							</div>
							<%} %>

							<%for(int i=1;i<=soTreEm;i++ ){%>
							<div
								class="chiTietKyGui__ThanhPhan desc--thongtinhanhkhach desc--boxThongtin">
								<div class="chiTietKyGui__ThanhPhan-TenHanhKhach"
									id='tenHK__nhapthongtinHKTE<%=i%>'>----</div>
								<div class="chiTietKyGui__ThanhPhan-HanhLyKyGui">
									<button type="button"
										class="HanhLyKyGui--thanhphan btn__GiamKhoiLuongKyGui">-</button>
									<div class="HanhLyKyGui--thanhphan">0</div>
									<button type="button"
										class="HanhLyKyGui--thanhphan btn__TangKhoiLuongKyGui">+</button>
									<input type="hidden" class="KhoiLuongKyGui"
										id="chiTietKyGui-SoLuongHanhKyGuiHKTE<%=i%> %>"
										name="KLHLTreEm<%=i%>" value="1">
								</div>
							</div>
							<%} %>
						</div>
					</div>
					<div class="thongTinHanhKhach__HinhAnhMoTa row col-xs-12  col-md-5">
						<img src="assets/images/hanhLy__NhapThongTinHK.png"
							class="img_HanhLy" alt="Hành Lý Cho Phép">
						<div class="desc desc--thongtinhanhkhach">*Kích thước bao
							gồm tay cầm và bánh xe</div>
					</div>
				</div>
				<!--/. nhập thông tin khach hàng - nhập số hành lý ký gửi -->

				<!-- thanh chuyen tiep-->
				<div class="row">
					<div class="thanhchuyentiep" id="thanhchuyentiep-DienThongTin">
						<button type="button" class="_btnQuayLai"
							id="btn__quaylai-DienThongTin">Quaylai</button>
						<div class="tongtienchuyenbay">
							<span class="tongtien">Tổng Tiền:</span> <span class="tongtien"
								id="thanhchuyentiep-DienThongTin-tongtien"></span> <span>.000VND</span>
						</div>
						<input type="hidden" id="tong_tien" name="tong_tien" />
						<button type="submit" class="_btnChuyenTiep"
							id="btn__chuyentiep-DienThongTin"
							onclick="return submitDienThongTinHk(<%=soNguoiLon%>,<%=soTreEm%>)">Tiếp
							theo</button>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- /.thanh chuyen tiep-->

	<!--phần chân trang-->
	<jsp:include page="/footer.jsp"></jsp:include>
</body>