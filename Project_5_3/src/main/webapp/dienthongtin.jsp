<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>


</head>
<body>
	<script>
		document.addEventListener('DOMContentLoaded', function() {
			list_month(), list_year(), list_date(), MobileCountry()
		});
	</script>
	
	<jsp:include page="/header.jsp"></jsp:include>
	
	<form action="" name="DienThongTinHanhKhach" method="post">
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
					<div class="thongTinHanhKhach col-xs-12  col-md-7 ">
						<div class="thongTinHanhKhach__BoxDienThongTin"
							id="box-dienThongTinNguoiLon">
							<div class="desc desc--boxThongtin">
								Hành khách <span id="stt-HanhKhach__dienthongtinHK">1</span>
								(Người lớn)
							</div>
							<div class="thanhNhapThongTin thanhNhapThongTin--row0">
								<div class="boxnhapthongtinHK">
									<input type="text"
										class="theInput form-control hovaten__nhapthongtinHK"
										id="hovaten__nhapthongtinHKNL1" placeholder="Họ Và Tên*" />
									<div class="warning"></div>
								</div>
								<div class="boxnhapthongtinHK">
									<input type="date" class="theInput form-control"
										id="ngaySinh__nhapthongtinHKNL1" placeholder="Ngày sinh*" />
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
										id="email__nhapthongtinHKNL1" placeholder="Email*" />
									<div class="warning"></div>
								</div>
								<div class="boxnhapthongtinHK">
									<input type="text" class="theInput form-control"
										id="SDT__nhapthongtinHKNL1" placeholder="Số Điện Thoại*" />
									<div class="warning"></div>
								</div>
							</div>
							<div class="thanhNhapThongTin">
								<div class="boxnhapthongtinHK">
									<input type="text" class="theInput form-control"
										id="DiaChi__nhapthongtinHKNL1" placeholder="Địa Chỉ" />
									<div class="warning"></div>
								</div>
								<div class="boxnhapthongtinHK">
									<input type="text" class="theInput form-control"
										id="QuocTich__nhapthongtinHKNL1" placeholder="Quốc Tịch" />
									<div class="warning"></div>
								</div>
							</div>
							<div class="thanhNhapThongTin">
								<div class="boxnhapthongtinHK">
									<input type="text" class="theInput form-control"
										id='GioiTinh__nhapthongtinHKNL1' placeholder="Giới Tính" />
									<div class="warning"></div>
									<div class="boxmota">
										<div class="desc desc--moTaNgaySinh">Nam/Nữ Ví Dụ: Nam</div>
									</div>
								</div>
								<div class="boxnhapthongtinHK">
									<input type="text" class="theInput form-control"
										id="CCCD__nhapthongtinHKNL1" placeholder="CCCD/CMND" />
									<div class="warning"></div>
								</div>
							</div>
						</div>
						<div class="thongTinHanhKhach__BoxDienThongTin"
							id="box-dienThongTinTreEm">
							<div class="desc desc--boxThongtin">
								Hành khách <span id="stt-HanhKhach__dienthongtinHK">2</span>
								(Trẻ em)
							</div>
							<div class="thanhNhapThongTin thanhNhapThongTin--row0">
								<div class="boxnhapthongtinHK">
									<input type="text"
										class="theInput form-control hovaten__nhapthongtinHK "
										id="hovaten__nhapthongtinHKTE1" placeholder="Họ Và Tên*" />
									<div class="warning"></div>
								</div>
								<div class="boxnhapthongtinHK">
									<input type="date" class="theInput form-control"
										id="ngaySinh__nhapthongtinHKTE1" placeholder="Ngày sinh*" />
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
										id="DiaChi__nhapthongtinHKTE1" placeholder="Địa Chỉ" />
									<div class="warning"></div>
								</div>
								<div class="boxnhapthongtinHK">
									<input type="text" class="theInput form-control"
										id="QuocTich__nhapthongtinHKTE1" placeholder="Quốc Tịch" />
									<div class="warning"></div>
								</div>
							</div>
							<div class="thanhNhapThongTin">
								<div class="boxnhapthongtinHK">
									<input type="text" class="theInput form-control"
										id="GioiTinh__nhapthongtinHKTE1" placeholder="Giới Tính" />
									<div class="warning"></div>
									<div class="boxmota">
										<div class="desc desc--moTaNgaySinh">Nam/Nữ Ví Dụ: Nam</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /. kết thúc box danh sách chuyến bay đi và bay về-->

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
											<span class="required" id="chuyendi__macb"></span>
										</div>
										<div
											class="chyenbayduocchon__item__part chyenbayduocchon__item__part--text-align-right">
											<span class="chyenbayduocchon-thongtin"
												id="chuyendi__ngaybay"> </span> <br> <span
												class="chyenbayduocchon-thongtin" id="chuyendi__giobay">
											</span> <br> <span class="chyenbayduocchon-thongtin"
												id="chuyendi__lichbay"> </span> <br> <span
												class="chyenbayduocchon-thongtin color-grey"
												id="chuyendi__hanhtrinhbay"></span>
										</div>
									</div>
									<div class="chyenbayduocchon__item">
										<div class="chyenbayduocchon__item__part"></div>
										<div class="chyenbayduocchon__item__part">
											<div class="thongtinchitietgiave-item">
												<div class="thongtinchitietgiave-title">Giá vé :</div>
												<div class="thongtinchitietgave-giave">
													<span id="chuyendi__giave"></span>.000VND
												</div>
											</div>
											<div class="thongtinchitietgiave-item">
												<div class="thongtinchitietgiave-title">Thuế :</div>
												<div class="thongtinchitietgave-giave">
													<span id="chuyendi__thue"></span>.000VND
												</div>
											</div>
											<div class="thongtinchitietgiave-item">
												<div class="thongtinchitietgiave-title">Tổng :</div>
												<div class="thongtinchitietgave-giave">
													<span id="chuyendi__tongtien"></span>.000VND
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<br> <br>
							<div
								class="chyenbayduocchon__chuyenbay  trangDienThongTinHanhKhach__muavemaybay"
								id="chuyenbayduocchon__chuyenve-DienThongTinHK">
								<div class="chyenbayduocchon__title">Chuyến Về</div>
								<div class="chyenbayduocchon__chitietchuyenbay">
									<div class="chyenbayduocchon__item">
										<div class="chyenbayduocchon__item__part">
											<span class="required" id="chuyenve__macb"> </span>
										</div>
										<div
											class="chyenbayduocchon__item__part chyenbayduocchon__item__part--text-align-right">
											<span class="chyenbayduocchon-thongtin"
												id="chuyenve__ngaybay"> </span> <br> <span
												class="chyenbayduocchon-thongtin" id="chuyenve__giobay">
											</span> <br> <span class="chyenbayduocchon-thongtin"
												id="chuyenve__lichbay"></span> <br> <span
												class="chyenbayduocchon-thongtin color-grey"
												id="chuyenve__hanhtrinhbay"> </span>
										</div>
									</div>
									<div class="chyenbayduocchon__item">
										<div class="chyenbayduocchon__item__part"></div>
										<div class="chyenbayduocchon__item__part">
											<div class="thongtinchitietgiave-item">
												<div class="thongtinchitietgiave-title">Giá vé :</div>
												<div class="thongtinchitietgave-giave">
													<span id="chuyenve__giave"></span>.000VND
												</div>
											</div>
											<div class="thongtinchitietgiave-item">
												<div class="thongtinchitietgiave-title">Thuế :</div>
												<div class="thongtinchitietgave-giave">
													<span id="chuyenve__thue"></span>.000VND
												</div>
											</div>
											<div class="thongtinchitietgiave-item">
												<div class="thongtinchitietgiave-title">Tổng :</div>
												<div class="thongtinchitietgave-giave">
													<span id="chuyenve__tongtien"></span>.000VND
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
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
							phí. Xem chính sách hành lý đầy đủ.</div>

						<div class="thongTinHanhKhach__chiTietKyGui">
							<div class="chiTietKyGui__ThanhPhan desc--thongtinhanhkhach">
								<div class="chiTietKyGui__ThanhPhan-TenHanhKhach">Hành
									khách</div>
								<div class="chiTietKyGui__ThanhPhan-HanhLyKyGui">Hành lý
									ký gửi</div>
							</div>
							<div
								class="chiTietKyGui__ThanhPhan desc--thongtinhanhkhach desc--boxThongtin">
								<div class="chiTietKyGui__ThanhPhan-TenHanhKhach"
									id='tenHK__nhapthongtinHKNL1'>Nguyen Van A</div>
								<div class="chiTietKyGui__ThanhPhan-HanhLyKyGui">
									<button type="button"
										class="HanhLyKyGui--thanhphan  btn__GiamKhoiLuongKyGui">-</button>
									<div class="HanhLyKyGui--thanhphan">1</div>
									<button type="button"
										class="HanhLyKyGui--thanhphan btn__TangKhoiLuongKyGui">+</button>
									<input type="hidden" class="KhoiLuongKyGui"
										id="chiTietKyGui-SoLuongHanhKyGuiHKNL1" value="1">
								</div>
							</div>
							<div
								class="chiTietKyGui__ThanhPhan desc--thongtinhanhkhach desc--boxThongtin">
								<div class="chiTietKyGui__ThanhPhan-TenHanhKhach"
									id='tenHK__nhapthongtinHKTE1'>Nguyen Van B</div>
								<div class="chiTietKyGui__ThanhPhan-HanhLyKyGui">
									<button type="button"
										class="HanhLyKyGui--thanhphan btn__GiamKhoiLuongKyGui">-</button>
									<div class="HanhLyKyGui--thanhphan">1</div>
									<button type="button"
										class="HanhLyKyGui--thanhphan btn__TangKhoiLuongKyGui">+</button>
									<input type="hidden" class="KhoiLuongKyGui"
										id="chiTietKyGui-SoLuongHanhKyGuiHKTE1" value="1">
								</div>
							</div>
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
								id="thanhchuyentiep-DienThongTin-tongtien">0</span><span>.000VND</span>
						</div>
						<button type="button" class="_btnChuyenTiep"
							id="btn__chuyentiep-DienThongTin"
							onclick="return submitDienThongTinHk(1,1)">Tiếp theo</button>
					</div>
				</div>
	</form>
	<!-- /.thanh chuyen tiep-->

	<!--phần chân trang-->
	<div class="container">
		<div class="row">
			<div class="chanTrang">
				<div class="col-sm-3">
					<a><img src="assets/images/logo.jpg" class="img_chania.jpg"
						alt="LOGO"></a>
				</div>
				<div class="col-sm-3">
					<div class="chanTrang">
						<span class="chanTrang__title">THÔNG TIN LIÊN HỆ</span> <br>
						<br> <span>Đia Chỉ</span> <br> <br> <span>54
							Nguyễn Lương Bằng, Liên chiểu, Đà nẵng</span> <br> <br> <span>Điện
							Thoại</span> <br> <br> <span>0375656657</span>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="chanTrang">
						<span class="chanTrang__title">GIỚI THIỆU</span> <br> <br>
						<span><a>Về chúng tôi</a></span> <br> <br> <span><a>Liên
								hệ</a></span>
					</div>
				</div>
				<div class="col-sm-3">
					<div class="chanTrang">
						<span class="chanTrang__title">CHÍNH SÁCH</span> <br> <br>
						<span><a>Chính sách/quy định chung</a></span> <br> <br>
						<span><a>Thông tin thanh toán</a></span>
					</div>
				</div>
			</div>
		</div>
		<hr>
		<div class="container">
			<div class="footer grid">
				<ul class="footer--item">
					<li class="footer--item-icon"><a href="#"><i
							class="fa-brands fa-twitter"></i></a></li>
					<li class="footer--item-icon"><a href="#"><i
							class="fa-brands fa-instagram"></i></a></li>
					<li class="footer--item-icon"><a href="#"><i
							class="fa-brands fa-facebook"></i></a></li>
				</ul>
				<ul class="footer--item">
					<li class=" footer--item-copyright"><span>© 2024
							Baconcuu </span></li>
				</ul>
			</div>
		</div>
	</div>

</body>