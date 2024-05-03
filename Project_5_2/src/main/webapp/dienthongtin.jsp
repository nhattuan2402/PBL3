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
		<form id="dangNhap" name="dangNhap" action="#" method="Post">
			<div class="container__form navbar__dangNhap">
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
						<button type="button" class="btnSubmitEnroll" value="Dangnhap"
							onclick=" return kiemtraInputDangNhap('memberEmailSignIn','memberPasswordSignIn')">Đăng
							Nhập</button>
					</div>
				</div>
				<div class="row ">
					<div class="col-xs-4 col-sm-12">
						<span class="desc">Bạn chưa có tài khoản thành viên? <a
							href="#" class="_dangky">Đăng Ký Tài Khoản</a></span>
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
		<form name="dangKy" action="#" method="Post">
			<div class="navbar__dangKy" id="formEnroll">
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
					</div>
					<div class="row">
						<div class="formdangky-row">
							<p class="form-title col-xs-12 col-md-4">
								<span id="MembersGender">Giới Tính<span class='required'>*</span></span>
							<div class="formdangky-row__gender">
								<label class="formernoll-gender" for="male">Nam</label> <input
									class="formernoll-gender" id="male" type="radio" name="gender"
									value="1" checked="true"> <label
									class="formernoll-gender" for="female">Nữ</label> <input
									class="formernoll-gender" id="female" type="radio"
									name="gender" value="0">
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
										placeholder="Nhap ho va ten" />
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
							<fieldset class="birthdayPicker">
								<div class="col-xs-4 col-md-4">
									<div class="move-top">
										<label for="enroll-birth-date" class="move-top-label"
											id="enroll-birth-date-label">Ngày</label> <select
											class="birthDate form-control selectBox selectBoxDefault move-top-input icon-sort span2"
											id="enroll-birth-date">
											<option hidden="" selected=""></option>

										</select>
										<div class="warning"></div>
									</div>
								</div>
								<div class="col-xs-4 col-md-4">
									<div class="move-top">
										<label for="enroll-birth-month" class="move-top-label"
											id="enroll-birth-month-label">Tháng</label> <select
											class="birthMonth validate[required] form-control selectBox selectBoxDefault move-top-input icon-sort span2"
											id="enroll-birth-month">
											<option hidden="" selected=""></option>

										</select>
										<div class="warning"></div>
									</div>
								</div>
								<div class="col-xs-4 col-md-4">
									<div class="move-top">
										<label for="enroll-birth-year" class="move-top-label"
											id="enroll-birth-year-label">Năm</label> <select
											class="birthYear validate[required] form-control selectBox selectBoxDefault move-top-input icon-sort span2"
											id="enroll-birth-year">
											<option hidden="" selected=""></option>

										</select>
										<div class="warning"></div>
									</div>
								</div>
								<input class="birthDay" name="birthDay" type="hidden">
							</fieldset>
							<input type="hidden" name="txtDateOfBirthDate"
								id="txtDateOfBirthDate"> <input type="hidden"
								name="txtDateOfBirthMonth" id="txtDateOfBirthMonth"> <input
								type="hidden" name="txtDateOfBirthYear" id="txtDateOfBirthYear">
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
										placeholder="Nhap dia chi" />
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
										autocomplete="off" placeholder="Nhap so dien thoai" />
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
							<button type="button" class="btnSubmitEnroll " value="Dangky"
								onclick=" return kiemtraInputDangKy('fulltNameSignUp','enroll-birth-date', 'enroll-birth-month', 'enroll-birth-year', 'companyCity','memberEmailSignUp','mobileNumberSignUp','memberPasswordSignUp','dongyVoiDieuKhoan','nhanthongbao')">Tạo
								Tài Khoản</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<!-- / KET THUC PHAN FORM DANG KY-->


		<!-- form CSKH-->
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
			<!--kết thúc phần tittle CSKH-->
			<!--nenuvar-->

			<div class="phieuYeuCauHoTro row">
				<form name="phieuYeuCauHoTro" action="#" method="Post">
					<div class="content">
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
									<input name="vanDeCSKH" id="MaVe__CSKH" type="text"
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
										id="ChiTietYeuCau__CSKH" cols="79" rows="4" name=" mô tả"
										wrap="PHYSICAL"></textarea>
									<div class="warning"></div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-12 col-sm-12">
							<button type="button" class="btnSubmitformCSKH " value="Gui"
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
					<li><a href="#" class="dangnhap">Đăng nhập</a></li>
					<li class="dangky"><a class="dangky" hef="#formEnroll">Đăng
							Ký</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<!--Kết thúc header-->

	<!-- chọn chuyến bay-->
	\
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