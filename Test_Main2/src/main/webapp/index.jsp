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
        <link rel="stylesheet" href="./assets/style/base.css" /> 
        <link rel="stylesheet" href="./assets/style/main.css" /> 
        <script src ="./events/events1.0.js"></script>

	<%
		String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
	%>
				
    </head>
    <body>
        <script>
            document.addEventListener('DOMContentLoaded', function() {
                list_month(),
                list_year(),
                list_date(),
                MobileCountry()
            });
        </script>
        
        <div class="thongBao">
            <diV class="thongbao">
            <span>Đăng ký Tài khoản để cập nhật các thông tin, ưu đãi mới nhất từ  Baconcuu Airlines.</span>
            </diV>

            <!-- form dang ky tai khoan-->
            <form  name="dangKy" action="<%=url%>/khach-hang-controller" method="Post">
                <div class="navbar__dangKy">
                    <div class="navbar__formdangky">
                            <div class="row">
                                <div class=" title_enroll col-xs-10  col-md-10">
                                    <span>
                                    Đăng ký với baconcuu Airline
                                    </span> 
                                </div>
                                <div class="navbar__formdangky__icon-exit col-xs-2  col-md-2 navbar__formdangky__icon-exit"  title="Hủy Đăng Ký"><i class="fa fa-times" aria-hidden="true"></i></div>
                            </div>
                        <div class="row">
                            <div class="formdangky-row">
                                <span class="desc col-xs-12 col-md-12">Đăng ký tài khoản thành viên hoàn toàn miễn phí để sử dụng.Hãy click vào phần chọn nhận thông báo để nhận ưu đãi mới nhất.</span>
                            </div>
                        </div>
                        <div class="row">
                            <div class="formdangky-row">
                                <p class="form-title col-xs-12 col-md-4">
                                    <span id="MembersGender">Giới Tính<span class='required'>*</span></span>
                                    <div class="formdangky-row__gender">
                                        <label class="formernoll-gender" for="male" >Nam</label>
                                        <input class="formernoll-gender" id="male" type="radio"  name="gender" value="1" checked="true">
                                        <label class="formernoll-gender" for="one-way">Nữ</label>
                                        <input class="formernoll-gender" type="radio"  name="gender" value="0">
                                    </div>
                                </p>
                                <div class="col-xs-12 col-md-8">
                                </div>
                            </div>
                        </div>
                        <!--/.row gender-->
                        <div class="row">
                            <div class="formdangky-row">
                                <p class="form-title col-xs-12 col-md-4">
                                    <span class="formdangky-row__fulltName">Họ Và Tên<span class='required'>*</span></span>
                                </p>
                                <div class="col-xs-12 col-md-8">
                                    <div class="fullName-container">
                                        <input name="fullName" type="text"class=" formdangky-row__input form-control " placeholder="Nhap ho va ten"/>
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
                                        <div class="move-top"><label for="enroll-birth-date" class="move-top-label" id="enroll-birth-date-label">Ngày</label>
                                            <select class="birthDate validate[required] form-control selectBox selectBoxDefault move-top-input icon-sort span2" id="enroll-birth-date" >
                                                <option hidden="" selected=""></option>
                                                
                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-4 col-md-4">
                                    <div class="move-top"><label for="enroll-birth-month" class="move-top-label" id="enroll-birth-month-label">Tháng</label>
                                        <select class="birthMonth validate[required] form-control selectBox selectBoxDefault move-top-input icon-sort span2" id="enroll-birth-month" >
                                            <option hidden="" selected=""></option>

                                        </select>
                                    </div>
                                </div>
                                <div class="col-xs-4 col-md-4">
                                    <div class="move-top">
                                        <label for="enroll-birth-year" class="move-top-label" id="enroll-birth-year-label">Năm</label>
                                        <script>
                                            var h="ddd"
                                        </script>
                                        <select class="birthYear validate[required] form-control selectBox selectBoxDefault move-top-input icon-sort span2" id="enroll-birth-year">
                                            <option hidden="" selected=""></option>
                                            
                                        </select>
                                    </div>
                                </div>
                                    <input class="birthDay" name="birthDay" type="hidden">
                                    </fieldset>
                                    <input type="hidden" name="txtDateOfBirthDate" id="txtDateOfBirthDate">
                                    <input type="hidden" name="txtDateOfBirthMonth" id="txtDateOfBirthMonth">
                                    <input type="hidden" name="txtDateOfBirthYear" id="txtDateOfBirthYear">
                                    <input type="hidden" name="txtDateOfBirth" id="txtDateOfBirth">
                                </div>
                            </div>
                                <!-- /.row birth -->
                        <div class="row">
                            <div class="formdangky-row">
                                <p class="form-title col-xs-12 col-md-4">
                                    <span class="bldiaChi">Quận/Thành Phố</span>
                                    <span class="required">*</span>
                                </p>
                                <div class="col-xs-12 col-md-8">
                                    <div class="move-top" id="company-city-select" style="display: none;">
                                        <select name="content_0$ddlLotusMilesEnrollCompanyDistrict" id="ddlLotusMilesEnrollCompanyDistrict" class="form-control selectBox selectBoxDefault move-top-input icon-sort validate[required]"></select>
                                    </div>
                                    <div class="move-top" id="company-city-input">
                                        <input name="companyCity" type="text" id="companyCity" class="form-control move-top-input validate[required,maxSize[32],custom[companyName]]" maxlength="32" placeholder="Nhap dia chi" />  
                                    </div>
                                </div>
                            </div>
                        </div>
                            <!-- /.row dia chi -->
                        <div class="row">
                            <div class="formdangky-row">
                                <p class="form-title col-xs-12 col-md-4">
                                    <span id="MemberEmail">Địa chỉ thư điện tử<span class='required'>*</span></span>
                                </p>
                                <div class="col-xs-12 col-md-8">
                                    <div class="move-top">
                                        <input name="memberEmail" type="text" id="memberEmail" class="form-control move-top-input validate[required,maxSize[120],custom[email]]" maxlength="120" placeholder="Nhap email" />
                                    </div>
                                </div>
                            </div>
                        </div>
                                <!--/.row thu dien thu-->
                        <div class="row">
                            <div class="formdangky-row">
                                <p class="form-title title-left col-xs-12 col-sm-4">
                                    <span id="lblLotusMilesEnrollMobile">Di động<span class='required'>*</span></span>
                                </p>
                                <div class="col-xs-12 col-sm-3">
                                    <div class="move-top">
                                        <select name="ddlLotusMilesEnrollMobileCountry" id="ddlLotusMilesEnrollMobileCountry" class="form-control selectBox selectBoxDefault move-top-input icon-sort validate[required]" style="font-size: small;">
                
                                        </select>
                                        <label for="ddlLotusMilesEnrollMobileCountry" id="lblLotusMilesEnrollMobileCountry" class="move-top-label">Chọn Quốc gia/vùng</label>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-5">
                                    <div class="move-top">
                                        <input name="mobileNumber" type="text" id="mobileNumber" class="form-control move-top-input validate[required,maxSize[12],custom[onlyNumber]]" maxlength="12" autocomplete="off" placeholder="Nhap so dien thoai" />
                                        <label for="mobileNumber" id="lblLotusMilesEnrollMobileNumber" class="move-top-label">Số điện thoại</label>
                                        <span id="lblLotusMilesEnrollMobileNumberGuide" class="move-top-label">(Tối đa 12 số)</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="formdangky-row">
                                <p class="form-title col-xs-12 col-md-4">
                                    <span class="formdangky-row__nhapmk">Nhập mật khẩu<span class='required'>*</span></span>
                                </p>
                                <div class="col-xs-12 col-md-6">
                                    <div class="fullName-container">
                                        <input name="memberpassword" type="password"class=" formdangky-row__input form-control " placeholder="Nhap mat khau"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="formdangky-row check-item ">
                                <input type="checkbox" id="checkbox" name="terms" value="agree">
                                <label for="checkbox1">Tôi đồng ý với các <a href="#">điều khoản</a></label>
                            </div>
                        </div>
                        <div class="row ">
                            <div class="formdangky-row check-item ">
                                <input type="checkbox" id="checkbox2" name="alerts" value="latest">
                                <label for="checkbox">Gửi cho tôi thông báo mới nhất</label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-sm-12">
                                <button type="submit" class="btnSubmitEnroll ">Tạo Tài Khoản</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            
        <!--kết thúc đăng ký tài khoản-->

        </div>
        <!-- header-->
    <nav class="navbar">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#abc">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#"><img src="assets/images/images1.0/logo.jpg" class="img_chania.jpg" alt="LOGO"></a>
            </div>
            <div class="collapse navbar-collapse" id="abc">
                <ul class="nav navbar-nav navbar-right">
                    <li class="active"><a href="#">Mua vé & Sản phẩm</a></li>
                    <li><a href="#">Hỗ trợ</a></li>
                    <li><a href="#">Đăng nhập</a></li>
                    <li class="dangky">
                        <a class="dangky">Đăng Ký</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
        <!--Kết thúc header-->
        
        <!--Tìm kiếm vé máy bay-->
        <form name="timchuyenbay" action="#" method="Post">
            <div class="jumbotron text-center">

                <span class="slogan">"Fly the friendly skies"</span>
                <br> <br> <br> <br> <br> <br><br>

                <div class="container">
                    <div class="timkiemchuyenbay slideanim">
                        <div class="timkiemchuyenbay__phantu timkiemchuyenbay--chonThanhPho" >
                            <i class="fa-solid fa-plane-departure"></i>
                            <button type="button" class="btn_diemkhoihanh"> Điểm khởi hành?</button>
                            <div class="timkiemchuyenbay__phantu-chonThanhPho timkiemchuyenbay__phantu-chonThanhPho--Diemdi">
                                <ul class="timkiemchuyenbay__phantu-list">
                                    <li class="timkiemchuyenbay__phantu-list-item diemkhoihanh" value="Hồ Chí Minh">Hồ Chí Minh</li>
                                    <li class="timkiemchuyenbay__phantu-list-item diemkhoihanh" value="Hà Nội">Hà Nội</li>
                                    <li class="timkiemchuyenbay__phantu-list-item diemkhoihanh" value="Đà Nẵng">Đà Nẵng</li>
                                    <li class="timkiemchuyenbay__phantu-list-item diemkhoihanh" value="Nghệ An">Nghệ An</li>
                                </ul>
                            </div>
                        </div>

                        <div class="timkiemchuyenbay__phantu timkiemchuyenbay--chonThanhPho" >
                            <i class="fa-solid fa-plane-arrival"></i>
                            <button type="button" class="btn_diemDen"> Điển đến?</button>
                            <div class=" timkiemchuyenbay__phantu-chonThanhPho timkiemchuyenbay__phantu-chonThanhPho--Diemden">
                                <ul class="timkiemchuyenbay__phantu-list">
                                    <li class="timkiemchuyenbay__phantu-list-item Diemden" value="Hồ Chí Minh">Hồ Chí Minh</li>
                                    <li class="timkiemchuyenbay__phantu-list-item Diemden" value="Hà Nội">Hà Nội</li>
                                    <li class="timkiemchuyenbay__phantu-list-item Diemden" value="Đà Nẵng">Đà Nẵng</li>
                                    <li class="timkiemchuyenbay__phantu-list-item Diemden" value="Nghệ An">Nghệ An</li>
                                </ul>
                            </div>
                        </div>

                        <div class="timkiemchuyenbay__phantu">
                                <i class="fa-regular fa-calendar"></i>
                                <button type="button" class="btn_lichBay">Ngày đi - ngày về</button>
                            <div class="timkiemchuyenbay_phantu__chonlich">
                                <div class="timkiemchuyenbay__chonlich">
                                    <label class="timkiemchuyenbay__chonlich__loaive" for="round-trip" >Khứ hồi</label>
                                    <input class="timkiemchuyenbay__chonlich__loaive" type="radio"  name="loaiVe" value="Khứ hồi" checked="true">
                                    <label class="timkiemchuyenbay__chonlich__loaive" for="one-way">Một chiều</label>
                                    <input class="timkiemchuyenbay__chonlich__loaive" type="radio"  name="loaiVe" value="Một chiều">
                                </div>
                                <div class="timkiemchuyenbay__chonlich">
                                    <label   class="timkiemchuyenbay__chonlich-chonngay" for="departure-date">Ngày đi:</label>
                                    <input  class="timkiemchuyenbay__chonlich-chonngay"   type="date" id="departure-date" name="departure-date">
                                </div>
                                <div class="timkiemchuyenbay__chonlich timkiemchuyenbay__chonlich__ngayve">
                                    <label class="timkiemchuyenbay__chonlich-chonngay" for="return-date">Ngày về:</label>
                                    <input class="timkiemchuyenbay__chonlich-chonngay"  type="date" id="return-date" name="return-date">
                                </div>
                                
                            </div>
                        </div>

                        <div class="timkiemchuyenbay__phantu timkiemchuyenbay__phantu--hienThiSoHanhKhach">
                            <i class="fa fa-user"></i> 
                            <button type="button" class="btn_HienthiSoHK" >1 Người lớn</button>
                                <div class="demSoKhachHang">
                                    <table>
                                        <div class="nguoiLon">
                                            <tr>
                                                <td>
                                                    <span>Người lớn:</span>
                                                </td>
                                                <td>
                                                    <button type="button" class="btCountNL">-</button>
                                                    <span class="numberNL">1</span>
                                                    <button type="button" class="btCountNL">+</button>
                                                </td>
                                            </tr>
                                        </div>
                                        <div class="treEm">
                                            <tr>
                                                <td>
                                                    <span>Trẻ em:</span>
                                                </td>
                                                <td>
                                                    <button type="button" class="btCountTE">-</button>
                                                    <span class="numberTE">0</span>
                                                    <button type="button" class="btCountTE">+</button>
                                                </td>
                                            </tr>
                                        </div>
                                    </table>
                                </div>
                            </div>
                            <button type="submit" class="timkiemchuyenbay__phantu timkiemchuyenbay__phantu--btnTimChuyenBay"> Tìm kiếm chuyến bay</button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <!--Kết thúc phần tìm kiếm-->

        <!--phần chân trang-->
        <div class="container">
            <div class="row">
                <div class="chanTrang">
                <div class="col-sm-3">
                    <a><img src="assets/images/images1.0/logo.jpg" class="img_chania.jpg" alt="LOGO"></a>
                </div>
                <div class="col-sm-3">
                    <div class="chanTrang">
                        <span class="chanTrang__title">THÔNG TIN LIÊN HỆ</span>
                        <br> <br>
                        <span>Đia Chỉ</span>
                        <br> <br>
                        <span>54 Nguyễn Lương Bằng, Liên chiểu, Đà nẵng</span>
                        <br> <br>
                        <span>Điện Thoại</span>
                        <br> <br>
                        <span>0375656657</span>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="chanTrang">
                        <span class="chanTrang__title">GIỚI THIỆU</span>
                        <br> <br>
                        <span><a>Về chúng tôi</a></span>
                        <br> <br>
                        <span><a>Liên hệ</a></span>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="chanTrang">
                        <span class="chanTrang__title">CHÍNH SÁCH</span>
                        <br> <br>
                        <span><a>Chính sách/quy định chung</a></span>
                        <br> <br>
                        <span><a>Thông tin thanh toán</a></span>
                    </div>
            </div>
        </div>
    </div>
        <hr>
        <div class="container">
	        <div class="footer grid">
	                <ul class="footer--item">
	                    <li class="footer--item-icon"><a href="#"><i class="fa-brands fa-twitter"></i></a></li>
	                    <li class="footer--item-icon"><a href="#"><i class="fa-brands fa-instagram"></i></a></li>
	                    <li class="footer--item-icon"><a href="#"><i class="fa-brands fa-facebook"></i></a></li>
	                </ul>
	                <ul class="footer--item">
	                    <li class=" footer--item-copyright"> <span>© 2024 Baconcuu </span></li>
	                </ul>
	        </div>
        </div>
    </body>
</html>