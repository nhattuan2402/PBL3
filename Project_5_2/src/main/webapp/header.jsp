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
<script src="./assets/events/formdangky.js"></script>
<script src="./assets/events/formdangnhap.js"></script>
<script src="./assets/events/formhotro.js"></script>
<script src="./assets/events/thanhtimkiem.js"></script>
<script src="./assets/events/chonchuyenbay.js"></script>
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

	<div class="containber">
		<div class="thongBao">
			<!--  phan thong bao-->
			<diV class="thongbao__noidung">
				<div>Đăng ký Tài khoản để cập nhật các thông tin, ưu đãi mới
					nhất từ Baconcuu Airlines.</div>
			</diV>
			<div class="thongbao__exit exit">
				<i class="fa fa-times " aria-hidden="true"></i>
			</div>
		</div>
		<!-- /. KET THUC PHAN THONG BAO-->

		<!-- form dang nhap-->
		<form id="dangNhap" name="dangNhap" action="<%=url%>/khach-hang-controller" method="Post">
			<input type="hidden" name="hanhDong" value="dang-nhap" />

			<%
			String currentPage = request.getRequestURI();
			int lastIndex = currentPage.lastIndexOf('/');
			if (lastIndex != -1) {
			    currentPage = currentPage.substring(lastIndex + 1);
			}
			session.setAttribute("trangHienTai", currentPage);
			String baoLoi = (String) request.getAttribute("baoLoiDangNhap");
			if (baoLoi == null) {
				baoLoi = "";
			}
			%>
			<div class="container__form navbar__dangNhap" <% if (!baoLoi.isEmpty()) { %> style="display: block" <%}%>>
				<div class="row">
					<div class=" title_signin col-xs-11  col-md-11">
						<span> Đăng Nhập với baconcuu Airline </span>
					</div>
					<div
						class="navbar__formdangnhap__icon-exit col-xs-1  col-md-1 navbar__formdangky__icon-exit  exit"
						title="Hủy Đăng Nhập">
						<i class="fa fa-times " aria-hidden="true"></i>
					</div>
				</div>
				<div class="row">
					<div class="formdangky-row">
						<span class="desc col-xs-12 col-md-12">Đăng ký tài khoản
							thành viên hoàn toàn miễn phí để sử dụng.Hãy click vào phần chọn
							nhận thông báo để nhận ưu đãi mới nhất.</span>
					</div>
				</div>
				<!--/.Kết thuc phần tittle form sign in-->

				<div class="row">
					<div class="formdangky-row">
						<span class="desc col-xs-12 col-md-12" style="color: red"><%=baoLoi%></span>
					</div>
				</div>

				<div class="row">
					<div class="formdangnhap-row">
						<div class="col-xs-12 col-md-12">
							<div class="move-top">
								<input name="signin__memberEmail" type="text"
									id="memberEmailSignIn" class="form-control move-top-input"
									maxlength="120" placeholder="Nhập email" required />
								<div class="warning"></div>
							</div>
						</div>
					</div>
				</div>
				<!--/.row thu dien thu-->
				<div class="row">
					<div class="formdangky-row">
						<div class="col-xs-12 col-md-12">
							<div class="fullName-container">
								<input name="signin__memberpassword" type="password"
									class=" formdangky-row__input form-control "
									id="memberPasswordSignIn" placeholder="password" required />
								<div class="warning"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="row ">
					<div class="col-xs-12 col-sm-12">
						<button type="submit" class="btnSubmitEnroll" value="Dangnhap"
							onclick=" return kiemtraInputDangNhap('memberEmailSignIn','memberPasswordSignIn')">Đăng
							Nhập</button>
					</div>
				</div>
				<div class="row ">
					<div class="col-xs-4 col-sm-12">
						<span class="desc">Bạn chưa có tài khoản thành viên? <a
							href="#">Đăng Ký Tài Khoản</a></span>
					</div>
				</div>
				<div class="row ">
					<div class="col-xs-4 col-sm-12">
						<span class="desc"><a href="#">Quên mật khẩu? </a></span>
					</div>
				</div>
			</div>
		</form>
		<!-- KÊT THUC PHAN DANG NHAP-->


		<!-- form dang ky tai khoan-->
		<form name="dangKy" action="<%=url%>/khach-hang-controller" method="Post">
			<input type="hidden" name="hanhDong" value="dang-ky" />

			<%
			String baoLoidk = request.getAttribute("baoLoiDangKy") + "";
			baoLoidk = baoLoidk.equals("null") ? "" : baoLoidk;

			String hoVaTen = request.getAttribute("hoVaTen") + "";
			hoVaTen = hoVaTen.equals("null") ? "" : hoVaTen;

			String ngaySinh = request.getAttribute("ngaySinh") + "";
			ngaySinh = ngaySinh.equals("null") ? "" : ngaySinh;

			String soDienThoai = request.getAttribute("soDienThoai") + "";
			soDienThoai = soDienThoai.equals("null") ? "" : soDienThoai;

			String email = request.getAttribute("email") + "";
			email = email.equals("null") ? "" : email;

			String diaChi = request.getAttribute("diaChi") + "";
			diaChi = diaChi.equals("null") ? "" : diaChi;

			String gioiTinh = request.getAttribute("gioiTinh") + "";
			gioiTinh = (gioiTinh == null || gioiTinh.equals("null")) ? "" : gioiTinh;
			%>
			<div class="navbar__dangKy" id="formEnroll"
				<%if (!baoLoidk.isEmpty()) {%> style="display: block" <%}%>>
				<div class="navbar__formdangky">
					<div class="row">
						<div class=" title_enroll col-xs-10  col-md-10">
							<span> Đăng ký với baconcuu Airline </span>
						</div>
						<div
							class="navbar__formdangky__icon-exit col-xs-2  col-md-2 navbar__formdangky__icon-exit  exit"
							title="Hủy Đăng Ký">
							<i class="fa fa-times " aria-hidden="true"></i>
						</div>
					</div>
					<div class="row">
						<div class="formdangky-row">
							<span class="desc col-xs-12 col-md-12">Đăng ký tài khoản
								thành viên hoàn toàn miễn phí để sử dụng.Hãy click vào phần chọn
								nhận thông báo để nhận ưu đãi mới nhất.</span>
						</div>
						<div class="formdangky-row">
							<span class="desc col-xs-12 col-md-12" style="color: red"><%=baoLoidk%></span>
						</div>
					</div>
					<div class="row">
						<div class="formdangky-row">
							<p class="form-title col-xs-12 col-md-4">
								<span id="MembersGender">Giới Tính<span class='required'>*</span></span>
							<div class="formdangky-row__gender">
								<label class="formernoll-gender" for="male">Nam</label> <input
									class="formernoll-gender" id="male" type="radio" name="gender"
									value="1"
									<%=gioiTinh.equals("1") || gioiTinh.isEmpty() ? "checked" : ""%>>
								<label class="formernoll-gender" for="female">Nữ</label> <input
									class="formernoll-gender" id="female" type="radio"
									name="gender" value="0"
									<%=gioiTinh.equals("0") ? "checked" : ""%>>
							</div>
							</p>
							<div class="col-xs-12 col-md-8"></div>
						</div>
					</div>
					<!--/.row gender-->
					<div class="row">
						<div class="formdangky-row">
							<p class="form-title col-xs-12 col-md-4">
								<span class="formdangky-row__fulltName">Họ Và Tên<span
									class='required'>*</span></span>
							</p>
							<div class="col-xs-12 col-md-8">
								<div class="fullName-container">
									<input name="fullName" type="text" id="fulltNameSignUp"
										class=" formdangky-row__input form-control "
										placeholder="Nhap ho va ten" value="<%=hoVaTen%>" />
									<div class="warning"></div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.row fullname -->
					<div class="row">
						<div class="formdangky-row">
							<p class="form-title col-xs-4 col-md-4">
								<span class="blbirthday">Ngày sinh<span class="required">*</span></span>
							</p>
							<div class="col-xs-12 col-md-8">
								<div class="fullName-container">
									<input name="dateOfBirth" type="date" id="fulltNameSignUp"
										class=" formdangky-row__input form-control "
										required="required" value="<%=ngaySinh%>" />
									<div class="warning"></div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.row birth -->
					<div class="row">
						<div class="formdangky-row">
							<p class="form-title col-xs-12 col-md-4">
								<span class="bldiaChi">Quận/Thành Phố</span> <span
									class="required">*</span>
							</p>
							<div class="col-xs-12 col-md-8">
								<div class="move-top" id="company-city-select"
									style="display: none;">
									<select name="content_0$ddlLotusMilesEnrollCompanyDistrict"
										id="ddlLotusMilesEnrollCompanyDistrict" class="form-control "></select>
								</div>
								<div class="move-top" id="company-city-input">
									<input name="companyCity" type="text" id="companyCity"
										class="form-control " maxlength="32"
										placeholder="Nhap dia chi" value="<%=diaChi%>" />
									<div class="warning"></div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.row dia chi -->
					<div class="row">
						<div class="formdangky-row">
							<p class="form-title col-xs-12 col-md-4">
								<span id="MemberEmail">Địa chỉ thư điện tử<span
									class='required'>*</span></span>
							</p>
							<div class="col-xs-12 col-md-8">
								<div class="move-top">
									<input name="memberEmailSignUp" type="text"
										id="memberEmailSignUp" class="form-control" maxlength="120"
										placeholder="Nhap email" />
									<div class="warning"></div>
								</div>
							</div>
						</div>
					</div>
					<!--/.row thu dien thu-->
					<div class="row">
						<div class="formdangky-row">
							<p class="form-title title-left col-xs-12 col-sm-4">
								<span id="lblLotusMilesEnrollMobile">Di động<span
									class='required'>*</span></span>
							</p>
							<div class="col-xs-12 col-sm-3">
								<div class="move-top">
									<select name="ddlLotusMilesEnrollMobileCountry"
										id="ddlLotusMilesEnrollMobileCountry"
										class="form-control selectBox " style="font-size: small;">

									</select> <label for="ddlLotusMilesEnrollMobileCountry"
										id="lblLotusMilesEnrollMobileCountry" class="move-top-label">Chọn
										Quốc gia/vùng</label>
								</div>
							</div>
							<div class="col-xs-12 col-sm-5">
								<div class="move-top">
									<input name="mobileNumber" type="text" id="mobileNumberSignUp"
										class="form-control move-top-input" maxlength="12"
										autocomplete="off" placeholder="Nhap so dien thoai"
										value="<%=soDienThoai%>" />
									<div class="warning"></div>
									<label for="mobileNumber" id="lblLotusMilesEnrollMobileNumber"
										class="move-top-label">Số điện thoại</label> <span
										id="lblLotusMilesEnrollMobileNumberGuide"
										class="move-top-label">(Tối đa 12 số)</span>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="formdangky-row">
							<p class="form-title col-xs-12 col-md-4">
								<span class="formdangky-row__nhapmk">Nhập mật khẩu<span
									class='required'>*</span></span>
							</p>
							<div class="col-xs-12 col-md-8">
								<div class="move-top">
									<input name="memberpassword" id="memberPasswordSignUp"
										type="password" class=" formdangky-row__input form-control "
										placeholder="Nhap mat khau" />
									<div class="warning"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="formdangky-row check-item ">
							<input type="checkbox" id="dongyVoiDieuKhoan" name="terms"
								value="agree"> <label for="dongyVoiDieuKhoan" id="check">Tôi
								đồng ý với các <a href="#">điều khoản</a>
							</label>
							<div class="warning"></div>
						</div>
					</div>
					<div class="row ">
						<div class="formdangky-row check-item ">
							<input type="checkbox" id="nhanthongbao" name="alerts"
								value="latest"> <label for="nhanthongbao">Gửi
								cho tôi thông báo mới nhất</label>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-12">
							<button type="submit" class="btnSubmitEnroll " value="Dangky"
								onclick=" return kiemtraInputDangKy('fulltNameSignUp','enroll-birth-date', 'enroll-birth-month', 'enroll-birth-year', 'companyCity','memberEmailSignUp','mobileNumberSignUp','memberPasswordSignUp','dongyVoiDieuKhoan','nhanthongbao')">Tạo
								Tài Khoản</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- / KET THUC PHAN FORM DANG KY-->


		<!-- form CSKH-->
		<%
		String thongBao = session.getAttribute("thongBao") + "";
		thongBao = thongBao.equals("null") ? "" : thongBao;
		Object obj1 = session.getAttribute("taiKhoan");
		if (obj1 != null) {
		%>
		<div class="cskh container__form" <%if (thongBao != "") {%>
			style="display: block" <%}%>>
			<div class="row">
				<div class="navbar__formcskh__icon-exit col-xs-12  col-md-12 exit"
					title="Hủy">
					<i class="fa fa-times " aria-hidden="true"></i>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 form-title title_enroll">
					TRUNG TÂM TRỢ GIÚP - CHÚNG TÔI Ở ĐÂY ĐỂ GIÚP BẠN</div>
			</div>
			<div class="phieuYeuCauHoTro row">
				<form name="phieuYeuCauHoTro"
					action="<%=url%>/khach-hang-controller" method="Post">
					<input type="hidden" name="hanhDong" value="yeu-cau-ho-tro" />
					<div class="content">
						<div class="row">
							<div class="phieuYeuCauHoTro-row"
								style="color: red; font-size: 16px">
								<%=thongBao%>
							</div>
						</div>
						<div class="row">
							<div class="phieuYeuCauHoTro-row">
								<p class="form-title col-xs-12 col-md-4">
									<span>Vấn Đề Bạn Gặp Phải<span class='required'>*</span></span>
								</p>
								<div class="col-xs-12 col-md-8">
									<input name="vanDeCSKH" id='VanDe__CSKH' type="text"
										class=" form-control " placeholder="Vấn đề">
									<div class="warning"></div>
								</div>
							</div>
						</div>
						<!-- /.row vấn đề yêu cầu cskh -->
						<div class="row">
							<div class="phieuYeuCauHoTro-row">
								<p class="form-title col-xs-12 col-md-4">
									<span>Email<span class='required'>*</span></span>
								</p>
								<div class="col-xs-12 col-md-8">
									<div class="move-top">
										<input name="memberEmailCSHK" id="Email__CSKH" type="text"
											class="form-control " maxlength="120"
											placeholder="Nhập email" />
										<div class="warning"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="phieuYeuCauHoTro-row">
								<p class="form-title col-xs-12 col-md-4">
									<span>Mã Vé<span class='required'>*</span></span>
								</p>
								<div class="col-xs-12 col-md-5">
									<input name="maVeCSKH" id="MaVe__CSKH" type="text"
										class=" form-control " placeholder="Mã vé">
									<div class="warning"></div>
								</div>
							</div>
						</div>
						<!-- /.row mã vé & địa chỉ thư điện tử-->

						<div class="row">
							<div class="phieuYeuCauHoTro-row">
								<p class="form-title col-xs-12 col-md-12">
									<span>Mô Tả Chi Tiết Yêu Cầu Hỗ Trợ Của bạn: <span
										class='required'>*</span></span>
								</p>
							</div>
						</div>
						<div class="row">
							<div class="phieuYeuCauHoTro-row">
								<div class="form-title col-xs-12 col-md-12">
									<textarea class="phieuYeuCauHoTro__Noidungchitiet"
										id="ChiTietYeuCau__CSKH" cols="79" rows="4" name="moTa"
										wrap="PHYSICAL"></textarea>
									<div class="warning"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-12">
							<button type="submit" class="btnSubmitformCSKH " value="Gui"
								onclick="return kiemtraInputPhieuHoTro('VanDe__CSKH','Email__CSKH','MaVe__CSKH','ChiTietYeuCau__CSKH')">Gửi</button>
						</div>
					</div>
					<div class="row">
						<div class="phieuYeuCauHoTro__LuuY-row">
							<span class="desc col-xs-12 col-md-12">Lưu ý <span
								class='required'>*</span>: Bộ phận cskh sẽ tiếp nhận yêu cầu hỗ
								trợ của bạn và phản hồi qua thư điện tử liên lạc của bạn, để
								biết thêm chi tiết vui lòng liên hệ qua số Holine:<a>19000091212</a>.
							</span>
						</div>
					</div>
				</form>
			</div>
		</div>

		<%
		} else {
		%>
		<div class="cskh container__form">
			<div class="row">
				<div class="navbar__formcskh__icon-exit col-xs-12  col-md-12 exit"
					title="Hủy">
					<i class="fa fa-times " aria-hidden="true"></i>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-12 col-sm-12 form-title title_enroll">
					TRUNG TÂM TRỢ GIÚP - CHÚNG TÔI Ở ĐÂY ĐỂ GIÚP BẠN</div>
			</div>
			<div class="content" style="display: block">
				<div class="row">
					<div class="phieuYeuCauHoTro-row"
						style="color: red; font-size: 20px">Bạn chưa đăng nhập. Vui
						lòng đăng nhập để được hỗ trợ.</div>
				</div>
			</div>
		</div>
		<%
		}
		%>
		<!--/. kết thúc form CSKH-->

		<!-- message box-->
		<div class="messagebox warning" id="messagebox_warning">
			<div class="messagebox__bieutuong messagebox__bieutuong--warning">
				<i class="fa-solid fa-circle-exclamation"></i>
			</div>
			<div class="messagebox__title">Bạn Ơi!</div>
			<div class="messagebox__content" id="messagebox_warning-content">
			</div>
		</div>

		<div class="messagebox Congratulations" id="messagebox_Congratulation">
			<div
				class="messagebox__bieutuong messagebox__bieutuong--Congratulations">
				<i class="fa-solid fa-circle-check"></i>
			</div>
			<div class="messagebox__title">Bạn Ơi!</div>
			<div class="messagebox__content"
				id="messagebox_Congratulations-content"></div>
		</div>
		<!-- ./ kết thúc message box-->
	</div>
	<!-- header-->
	<nav class="navbar">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#abc">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><img
					src="assets/images/logo.jpg" class="img_chania.jpg" alt="LOGO"></a>
			</div>
			<div class="collapse navbar-collapse" id="abc">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="index.html" class="muaVeVaSanPham">Mua
							vé & Sản phẩm</a></li>
					<li><a href="#" class="hoTro">Hỗ trợ</a></li>
					<%
					Object obj = session.getAttribute("taiKhoan");
					TaiKhoan taiKhoan = null;
					if (obj != null) {
						taiKhoan = (TaiKhoan) obj;
					}
					Object objkh = session.getAttribute("khachHang");
					Object objnv = session.getAttribute("nhanVien");

					NhanVien nhanVien = null;
					KhachHang khachHang = null;

					if (taiKhoan != null) {
						if (objnv != null) {
							nhanVien = (NhanVien) objnv;
						} else if (objkh != null) {
							khachHang = (KhachHang) objkh;

						}
					}

					if (nhanVien != null) {
					%>
					<li><a href="#" class="dangxuat"><%=nhanVien.getHoVaTen()%></a></li>
					<li><a
						href="<%=url%>/khach-hang-controller?hanhDong=dang-xuat"
						class="dangxuat">Đăng xuất</a></li>
					<%
					} else if (khachHang != null) {
					%>
					<li><a href="#" class="dangxuat"><%="Xin chào " + khachHang.getHoVaTen()%></a></li>
					<li><a
						href="<%=url%>/khach-hang-controller?hanhDong=dang-xuat"
						class="dangxuat">Đăng xuất</a></li>
					<%
					} else {
					%>
					<li><a href="#" class="dangnhap">Đăng nhập</a></li>
					<li class="dangky"><a class="dangky" href="#formEnroll">Đăng
							Ký</a></li>
					<%
					}
					%>
				</ul>
			</div>
		</div>
	</nav>
	<!--Kết thúc header-->
</body>