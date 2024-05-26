<%@page import="model.*"%>
<%@page import="database.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
		<title>website bán vé máy bay Baconcuu</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" /> 
        <script src = "https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
        <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
		<link rel="stylesheet" href="./assets/style/base.css" /> 
        <link rel="stylesheet" href="./assets/style/main.css" /> 
        <link rel="stylesheet" href="./assets/style/trangkhachhang.css" />
        <script src ="./assets/events/event_index.js"></script>
        <script src ="./assets/events/trangkhachhang.js"></script>
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
%>
</head>
<body>
	<jsp:include page="/header.jsp"></jsp:include>

	<div class="trangKhachHang">

		<!--suathongtincanhan-->
		<div class="modal fade" id="suathongtinkhachhang" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content  modal-content--guiemail">
					<div class="modal-header modal-header--xacthucemail">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<%
						TaiKhoan tk = (TaiKhoan) session.getAttribute("taiKhoan");
						KhachHang kh = (KhachHang) session.getAttribute("khachHang");
					%>
					<form action="<%=url%>/khach-hang-controller"
						name="thayDoiThongTin" method="post">
						<input type="hidden" name="hanhDong" value="thay-doi-thong-tin" />
						<div class="modal-body thaydoiemail__body">
							<div class="modal-title modal-title--thaydoiemail"
								id="exampleModalLongTitle">Thông Tin Cá Nhân</div>
							<div class="name-input ">
								<label class="title-animate input-label  ">Họ Và Tên</label>
								<div class="input-wrap  ">
									<div class="icf-user input-font">
										<i class="fa-regular fa-user"></i>
									</div>
									<input type="text" autocomplete="off" placeholder="Họ & Tên?"
										class="" value="trường" id="inputNameKhachhang"
										name="newHoVaTen">
								</div>
							</div>
							<div class="name-input ">
								<label class="title-animate input-label  ">Địa Chỉ</label>
								<div class="input-wrap  ">
									<div class="icf-user input-font">
										<i class="fa-regular fa-map"></i>
									</div>
									<input type="text" autocomplete="off" placeholder="Địa Chỉ?"
										class="" value="Dak Lak" id="inputDiaChiKhachhang"
										name="newDiaChi">
								</div>
							</div>
							<div class="name-input ">
								<label class="title-animate input-label  ">Ngày Sinh</label>
								<div class="input-wrap  ">
									<div class="icf-user input-font"></div>
									<input type="date" autocomplete="off" placeholder="Địa Chỉ?"
										class="" value="2024-05-12" id="inputNgaySinhKhachhang"
										name="newNgaySinh">
								</div>
							</div>

							<div class="name-input gender-input-wrap " data-click="gender">
								<label class="title-animate input-label">Giới Tính</label>
								<div class="input-wrap">
									<i class="fa-solid fa-venus-mars"></i> <input type="text"
										autocomplete="off" placeholder="Gender" value="Nữ" readonly
										id="inputGioiTinhKhachhang" name="newGioiTinh">
									<div class="icondong ">
										<i class="fa-solid fa-angle-up fa-rotate-180"></i>
									</div>
									<div class="inconxo hidden">
										<i class="fa-solid fa-angle-up "></i>
									</div>
									<div class="auto-list-wrapper hidden" id="gender-list">
										<ul>
											<li data-click="gender" class="gender-li ">Nam<i
												class="fa-solid fa-check icon-blue hidden"></i></li>
											<li data-click="gender" class="gender-li ">Nữ<i
												class="fa-solid fa-check icon-blue hidden"></i></li>
										</ul>
									</div>
								</div>
							</div>


							<button type="submit" class="btnLuThayDoithongtin">Lưu
								Thay Đổi</button>
						</div>
					</form>
				</div>
			</div>
		</div>

		<!--Modal chỉnh sửa password-->
		<div class="modal fade " id="thaydoipassword" tabindex="-1"
			role="dialog" aria-labelledby="exampleModalCenterTitle"
			aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered" role="document">
				<div class="modal-content modal-content--guiemail">
					<div class="modal-header modal-header--xacthucemail">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<div class="iconquaylai-password hidden ">
							<i class="fa-solid fa-angle-up fa-rotate-270"></i>
						</div>
					</div>


					<div
						class="modal-body thaydoiemail__body  class__suapassword hidden">
						<form action="<%=url%>/khach-hang-controller" method="post">
							<input type="hidden" name="hanhDong" value="doi-mat-khau">
							<div class="modal-title modal-title--thaydoiemail"
								id="exampleModalLongTitle">Thay Đổi Mật Khẩu</div>
							<div class="modal-body--thaydoiemail">
								<div class="phantieude-khachhang">Mật khẩu mới của bạn</div>
								<input type="password"
									class="phannoidung-khachhang phannoidung-khachhang--theinput "
									placeholder="Set new password" id="newpasswordkhachhang"
									name="newMatKhau">
								<div class="warning"></div>
							</div>
							<button type="submit"
								class="btn_yeucau-password btn_yeucau--pass"
								id="submit__yeucauthaypassword" data-index="2"
								onclick="return kiemtradauvaopassword('newpasswordkhachhang')">Xác
								Nhận</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- /. het phan Modal chỉnh sửa password-->

		<div class="container-fluid trangKhachHang__content ">
			<div class="container ">
				<div class="row ">
					<div class="boxTaiKhoanKhachHang col-xs-3 col-md-3">
						<div
							class="boxmenuTaiKhoanKhachHang__daumuc boxmenuTaiKhoanKhachHang__daumuc--phanmuc">
							<i class="fa-solid fa-user-large iconphanmuc"></i><span class="">Tài
								Khoản Thành Viên</span>
						</div>

						<ul class="boxmenuTaiKhoanKhachHang">
							<li class="boxmenuTaiKhoanKhachHang__phantu select__box ">
								<div class="boxmenuTaiKhoanKhachHang__daumuc">Thông Tin
									Tài Khoản</div>
							</li>
							<li class="boxmenuTaiKhoanKhachHang__phantu ">
								<div class="boxmenuTaiKhoanKhachHang__daumuc">Thông Tin Cá
									Nhân</div>
							</li>
							<li class="boxmenuTaiKhoanKhachHang__phantu">
								<div class="boxmenuTaiKhoanKhachHang__daumuc">Lịch Sử Giao
									Dịch</div>
							</li>
							<li class="boxmenuTaiKhoanKhachHang__phantu ">
								<div class="boxmenuTaiKhoanKhachHang__daumuc">Quản Lý
									Chuyến Bay</div>
							</li>
						</ul>
					</div>

					<div class="col-xs-9 col-md-9">

						<!-- box thong tin tài khoản khach hang-->
						<div
							class="boxthongtinhachhang  boxthongtinhachhang--thongtin container__thongtin   "
							id="thongTinTaiKhoanKhachHang">
							<div
								class="boxthongtinhachhang__dong boxthongtinhachhang__dong--tieude ">Tài
								khoản</div>
							<div class="boxthongtinhachhang__dong">
								<div class="boxthongtinhachhang__thanhphan">
									<div class="boxthongtinhachhang__thanhphan-the-trai">
										<div class="thanhphan-the-trai-tieude">
											<div class="the-tieude">
												<i class="fa-regular fa-file"></i>
												<div class="noidung-tieude">Mã số thành viên</div>
											</div>
										</div>
										<div class="noidungthe"><%=tk.getMaTaiKhoan()%></div>
									</div>
									<div class="boxthongtinhachhang__thanhphan-the-phai"></div>
								</div>
								<div class="boxthongtinhachhang__thanhphan">
									<div class="boxthongtinhachhang__thanhphan-the-trai">
										<div class="thanhphan-the-trai-tieude">
											<div class="the-tieude">
												<i class="fa-solid fa-shield-halved"></i>
												<div class="noidung-tieude">Mật khẩu</div>
											</div>
										</div>
										<div class="noidungthe">*****</div>
									</div>
									<div class="boxthongtinhachhang__thanhphan-the-phai">
										<a class="the-duong-dan class__btnSuaPassword"
											data-toggle="modal" data-target="#thaydoipassword">Thay
											đổi</a>
									</div>
								</div>
							</div>
							<div class="boxthongtinhachhang__dong">
								<div class="boxthongtinhachhang__thanhphan">
									<div class="boxthongtinhachhang__thanhphan-the-trai">
										<div class="thanhphan-the-trai-tieude">
											<div class="the-tieude">
												<i class="fa-regular fa-envelope"></i>
												<div class="noidung-tieude">Link email</div>
											</div>
										</div>
										<div class="noidungthe"><%=tk.getTenDangNhap()%></div>
									</div>
								</div>
								<div class="boxthongtinhachhang__thanhphan">
									<div class="boxthongtinhachhang__thanhphan-the-trai">
										<div class="thanhphan-the-trai-tieude">
											<div class="the-tieude">
												<i class="fa-solid fa-phone-volume"></i>
												<div class="noidung-tieude">Số điện thoại</div>
											</div>
										</div>
										<div class="noidungthe"><%=kh.getSoDienThoai()%></div>
									</div>
								</div>
							</div>
						</div>
						<!-- /. ket thuc box thong tin tài khoản khach hang-->

						<!-- box thong tin cá nhân khach hang-->
						<div
							class="boxthongtinhachhang  boxthongtinhachhang--thongtin container__thongtin hidden"
							id="thongTinCaNhanKhachHang">
							<div
								class="boxthongtinhachhang__dong boxthongtinhachhang__dong--tieude ">
								Thông Tin Cá Nhân
								<div class="the-duong-dan-title">
									<i class="fa-solid fa-pen-to-square"></i><a
										class="the-duong-dan-title" data-toggle="modal"
										data-target="#suathongtinkhachhang"
										id="chinhsuathongtinkhachhang">Chỉnh sửa</a>
								</div>
							</div>
							<div class="boxthongtinhachhang__dong">
								<div class="boxthongtinhachhang__thanhphan">
									<div class="boxthongtinhachhang__thanhphan-the-trai">
										<div class="thanhphan-the-trai-tieude">
											<div class="the-tieude  ">
												<i class="fa-regular fa-user"></i>
												<div class="noidung-tieude">Họ và tên</div>
											</div>
										</div>
										<div class="noidungthe" id="TenKhachHang"><%=kh.getHoVaTen()%></div>
									</div>
									<div class="boxthongtinhachhang__thanhphan-the-phai"></div>
								</div>
								<div class="boxthongtinhachhang__thanhphan">
									<div class="boxthongtinhachhang__thanhphan-the-trai">
										<div class="thanhphan-the-trai-tieude">
											<div class="the-tieude">
												<i class="fa-regular fa-calendar"></i>
												<div class="noidung-tieude">Ngày sinh</div>
											</div>
										</div>
										<div class="noidungthe" id="NgaySInhKhachHang"><%=kh.getNgaySinh()%></div>
									</div>
									<div class="boxthongtinhachhang__thanhphan-the-phai"></div>
								</div>
							</div>
							<div class="boxthongtinhachhang__dong">
								<div class="boxthongtinhachhang__thanhphan">
									<div class="boxthongtinhachhang__thanhphan-the-trai">
										<div class="thanhphan-the-trai-tieude">
											<div class="the-tieude">
												<i class="fa-regular fa-map"></i>
												<div class="noidung-tieude">Địa chỉ</div>
											</div>
										</div>
										<div class="noidungthe" id="DiaChiKhachHang"><%=kh.getDiaChi()%></div>
									</div>
									<div class="boxthongtinhachhang__thanhphan-the-phai"></div>
								</div>
								<div class="boxthongtinhachhang__thanhphan">
									<div class="boxthongtinhachhang__thanhphan-the-trai">
										<div class="thanhphan-the-trai-tieude">
											<div class="the-tieude">
												<i class="fa-solid fa-venus-mars"></i>
												<div class="noidung-tieude">Giới tính</div>
											</div>
										</div>
										<div class="noidungthe" id="GioiTinhKhachHang"><%=kh.isGioiTinh() ? "Nam" : "Nữ"%></div>
									</div>
									<div class="boxthongtinhachhang__thanhphan-the-phai"></div>
								</div>
							</div>
						</div>
						<!--/. kết thúc box thong tin cá nhân khach hang-->

						<%
							ArrayList<HoaDon> allHoaDon = HoaDonDAO.selectByIDKhachHang(kh.getMaKhachHang());
						%>
						<!-- box lịch sử giao dịch-->
						<div
							class="boxthongtinkhachhhang__hoadon container__thongtin hidden"
							id="LichSuGiaoDichKhachHang">
							<div class="vungchua">
								<div
									class="boxthongtinhachhang__dong boxthongtinhachhang__dong--tieude ">
									<div class="tieude">Lịch Sử Giao Dịch</div>
								</div>
								<div class="menubar__lichsugiaodich">
									<form action="" method="post">
										<div
											class="thetimkiemtheongay__lichsugiaodich menubar__lichsugiaodich--item">
											<button type="submit" class="tieude__lichsugiaodich">
												<i class="fa-solid fa-magnifying-glass"></i> Tìm theo ngày
											</button>
											<input type="date" class="lichsugiaodich__input">
										</div>
									</form>
									<button type="submit" class="menubar__lichsugiaodich--button"
										value="20">20 Ngày</button>
									<button type="submit" class="menubar__lichsugiaodich--button"
										value="30">30 Ngày</button>
								</div>
							</div>
							<div class="vungchuahoadon">
								<%
								for (HoaDon hd : allHoaDon) {
									ArrayList<HanhKhach> all = HanhKhachDAO.selectByMaHoaDon(hd.getMaHoaDon());
								%>
								<div class="hoadonbanhang">
									<div class="tieudehoadon">
										<div class="thanhphanhoadon-dong">
											<div class="thanhphanhoadon__daumuc">Mã Số Hóa Đơn:</div>
											<div
												class="thanhphanhoadon__noidung thanhphanhoadon__noidung--tieude"><%=hd.getMaHoaDon()%></div>
										</div>
									</div>
									<div class="phanthanhoadon">
										<div class="thanhphanhoadon-dong">
											<div class="thanhphanhoadon__daumuc">Ngày Thanh Toán:</div>
											<div class="thanhphanhoadon__noidung"><%=hd.getNgayDat()%></div>
										</div>
										<div class="thanhphanhoadon-dong">
											<div class="thanhphanhoadon__daumuc">ThanhToán Lúc:</div>
											<div class="thanhphanhoadon__noidung"><%=hd.getGioThanhToan()%></div>
										</div>
										<div class="thanhphanhoadon-dong">
											<div class="thanhphanhoadon__daumuc">Mã Chuyến Bay:</div>
											<div class="thanhphanhoadon__noidung"><%=hd.getMaChuyenBayDi()%>,<%=hd.getMaChuyenBayVe()%></div>
										</div>
										<div class="thanhphanhoadon-dong">
											<div class="thanhphanhoadon__daumuc">Mã Vé Đi:</div>
											<div class="thanhphanhoadon__noidung">
												<%
													for (HanhKhach hk : all) {
												%>
													<%=hk.getMaGheDi()%>,
												<%
													}
												%>
											</div>
										</div>
										<div class="thanhphanhoadon-dong">
											<div class="thanhphanhoadon__daumuc">Mã Vé Về:</div>
											<div class="thanhphanhoadon__noidung">
												<%
													for (HanhKhach hk : all) {
												%>
													<%=hk.getMaGheVe()%>,
												<%
												}
												%>
											</div>
										</div>
									</div>
									<div class="phantongtienhoadon">
										<div class="thanhphanhoadon-dong">
											<div class="thanhphanhoadon__daumuc">Tổng:</div>
											<div
												class="thanhphanhoadon__noidung thanhphanhoadon__noidung--tiongtien"><%=hd.getDonGia()%>.000VND</div>
										</div>
									</div>
								</div>
								<%
								}
								%>
							</div>
						</div>
						<!-- /. kết thúc box lịch sử giao dịch-->


						<!--  box thong tin chuyen bay khach hang-->

						<%
							ArrayList<QuanLyChuyenBay> allDaDi = QuanLyChuyenBayDAO.selectBeforeDate(kh.getMaKhachHang());
							ArrayList<QuanLyChuyenBay> allSapToi = QuanLyChuyenBayDAO.selectAfterDate(kh.getMaKhachHang());
							int dadi = allDaDi.size();
							int saptoi = allSapToi.size();
						%>

						<div
							class="boxthongtinkhachhhang__hoadon container__thongtin hidden"
							id="thongtinChuyenBayKhachHang">
							<div class="vungchua">
								<div
									class="boxthongtinhachhang__dong boxthongtinhachhang__dong--tieude ">
									<div class="tieude">Quản Lý chuyến Bay</div>
								</div>
								<ul
									class="boxthongtinhachhang__dong boxthongtinhachhang__dong-memu">
									<li class="boxthongtinhachhang__dong-muc select">Tất cả <span
										class="soluong">(<%=dadi+saptoi %>)</span></li>
									<li class="boxthongtinhachhang__dong-muc">Sắp tới <span
										class="soluong">(<%=saptoi%>)</span></li>
									<li class="boxthongtinhachhang__dong-muc">Hoàn thành <span
										class="soluong">(<%=dadi%>)</span></li>
								</ul>
							</div>
							<!--vemaybay-->
							<div class="vungchua-vemaybay">
							<div class="container__VeSapToi class__Vemaybay">
							<%
							for (QuanLyChuyenBay qlcb : allSapToi) {
								TuyenBay tb = TuyenBayDAO.layQuaDiemDiVaDen(qlcb.getChuyenBay().getDiemDi(), qlcb.getChuyenBay().getDiemDen());
							%>
								<!--vé Sắp tới-->
									<div class="vemaybay-mota">
										<div class="motatinhtrangve">
											<div class="tinhtrang">Sắp Tới</div>
										</div>

										<!--ve chuyen di-->
										<div class="vemaybay">
											<div class="ve-tieude">Thông tin</div>
											<div class="noidungve">
												<div class="thoigiandi"><%=qlcb.getChuyenBay().getNgayBay()%></div>
												<div class="ve-thongtinchuyenbay">
													<div class="thongtinhanhtrinhchitiet">
														<div class="ve-thongtinhanhtrinh">
															<div class="ve-lotrinh">
																<div class="ve-thanhpho"><%=qlcb.getChuyenBay().getDiemDi()%></div>
																<div class="ve-thoigian"><%=qlcb.getChuyenBay().getGioBay()%></div>
															</div>
														</div>

														<div class="thongtinbay">
															<div class="thanhphan"><%=tb.getThoiGianBay()%>h
															</div>
															<div class="thanhphan icon-vemaybay">
																<i class="fa-solid fa-plane"></i>
															</div>
															<div class="thanhphan">
																Bay Thẳng | <span class="chitietchuyenbay">Chi
																	tiết </span><span class="icondong "><i
																	class="fa-solid fa-angle-up fa-rotate-180"></i></span><span
																	class="inconxo hidden"><i
																	class="fa-solid fa-angle-up"></i></span>
															</div>
														</div>

														<div class="ve-thongtinhanhtrinh">
															<div class="ve-lotrinh">
																<div class="ve-thanhpho"><%=qlcb.getChuyenBay().getDiemDen()%></div>
															</div>
														</div>
													</div>
													<div class="thongtinsoluonghanhkhach"><%=qlcb.getSoHanhKhach()%>
														hành khách
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
													<span class="sohieuchuyenbay"><%=qlcb.getChuyenBay().getMaChuyenBay()%></span>
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
																<span class="noidunglichtrinh"><%=qlcb.getChuyenBay().getGioBay()%>,
																	<%=qlcb.getChuyenBay().getNgayBay()%> (Giờ địa phương)</span>
																<br> <span class="noidunglichtrinh"><%=qlcb.getChuyenBay().getDiemDi()%></span>
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
																<span class="noidunglichtrinh"><%=qlcb.getChuyenBay().getDiemDen()%></span>
															</div>
														</div>
													</div>
													<div class="chitietchuyenbay__thongtinchuyen">
														<span class="chitietchuyenbay__daumuc"> Thời gian:
														</span><span class="thongtinchuyenbay__noidung"><%=tb.getThoiGianBay()%>h</span>
														<span class="chitietchuyenbay__daumuc"> Airbus: </span><span
															class="thongtinchuyenbay__noidung"><%=qlcb.getChuyenBay().getMaMayBay()%></span>
														<span class="chitietchuyenbay__daumuc"> Khai thác
															bởi: </span><span class="thongtinchuyenbay__noidung">Baconcuu
															airline</span>
													</div>
												</div>
											</div>
										</div>
										<!--/. kết thúc ve chuyen di-->
									</div>
							
							<%
							}
							%>
								</div>
							<!--/. kết thúc vé Sắp tới-->

							<!--vé Hoàn Thành-->
							<div class="container__VeHoanThanh class__Vemaybay">
							<%
							for (QuanLyChuyenBay qlcb : allDaDi) {
								TuyenBay tb = TuyenBayDAO.layQuaDiemDiVaDen(qlcb.getChuyenBay().getDiemDi(), qlcb.getChuyenBay().getDiemDen());
							%>

								<div class="vemaybay-mota">
									<div class="motatinhtrangve">

										<div class="tinhtrang">Đã Hoàn Thành</div>
									</div>
									<!--ve chuyen di-->
									<div class="vemaybay">
										<div class="ve-tieude">Thông tin</div>
										<div class="noidungve">
											<div class="thoigiandi"><%=qlcb.getChuyenBay().getNgayBay()%></div>
											<div class="ve-thongtinchuyenbay">
												<div class="thongtinhanhtrinhchitiet">
													<div class="ve-thongtinhanhtrinh">
														<div class="ve-lotrinh">
															<div class="ve-thanhpho"><%=qlcb.getChuyenBay().getDiemDi()%></div>
															<div class="ve-thoigian"><%=qlcb.getChuyenBay().getGioBay()%></div>
														</div>
													</div>

													<div class="thongtinbay">
														<div class="thanhphan"><%=tb.getThoiGianBay()%>h
														</div>
														<div class="thanhphan icon-vemaybay">
															<i class="fa-solid fa-plane"></i>
														</div>
														<div class="thanhphan">
															Bay Thẳng | <span class="chitietchuyenbay">Chi
																tiết </span><span class="icondong "><i
																class="fa-solid fa-angle-up fa-rotate-180"></i></span><span
																class="inconxo hidden"><i
																class="fa-solid fa-angle-up"></i></span>
														</div>
													</div>

													<div class="ve-thongtinhanhtrinh">
														<div class="ve-lotrinh">
															<div class="ve-thanhpho"><%=qlcb.getChuyenBay().getDiemDen()%></div>
														</div>
													</div>
												</div>
												<div class="thongtinsoluonghanhkhach"><%=qlcb.getSoHanhKhach()%>
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
												<span class="sohieuchuyenbay"><%=qlcb.getChuyenBay().getMaChuyenBay()%></span>
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
															<span class="noidunglichtrinh"><%=qlcb.getChuyenBay().getGioBay()%>,
																<%=qlcb.getChuyenBay().getNgayBay()%> (Giờ địa phương)</span> <br>
															<span class="noidunglichtrinh"><%=qlcb.getChuyenBay().getDiemDi()%></span>
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
															<span class="noidunglichtrinh"><%=qlcb.getChuyenBay().getDiemDen()%></span>
														</div>
													</div>
												</div>
												<div class="chitietchuyenbay__thongtinchuyen">
													<span class="chitietchuyenbay__daumuc"> Thời gian: </span><span
														class="thongtinchuyenbay__noidung"><%=tb.getThoiGianBay()%>h</span>
													<span class="chitietchuyenbay__daumuc"> Airbus: </span><span
														class="thongtinchuyenbay__noidung"><%=qlcb.getChuyenBay().getMaMayBay()%></span>
													<span class="chitietchuyenbay__daumuc"> Khai thác
														bởi: </span><span class="thongtinchuyenbay__noidung">Baconcuu
														airline</span>
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
							<!--/. kết thúc vé Hoàn thành-->

						</div>
						<!--  /kết thúc box thong tin chuyen bay khach hang-->
					</div>
					<!--/. kết thúc box thong tin cá nhân khach hang-->
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="/footer.jsp"></jsp:include>
</body>