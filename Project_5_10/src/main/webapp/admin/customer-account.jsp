<%@page import="model.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
TaiKhoan admin = (TaiKhoan)session.getAttribute("admin");

if (admin != null) {
	request.setAttribute("admin", admin);
} else {
    response.sendRedirect(url + "/index.jsp");
    return;
}

ArrayList<KhachHang> allKhachHang = (ArrayList<KhachHang>)session.getAttribute("allKhachHang");
if (allKhachHang == null) {
	response.sendRedirect(url + "/index.jsp");
	return;
} 
%>
<title>QL Nhân viên</title>
<jsp:include page="includes-admin/header-admin.jsp"></jsp:include>
</head>
<style>
.themchuyenbay__dong select {
	width: 100%;
	padding: 5px;
	border: none;
	outline: none;
	padding: 1rem;
	border-radius: 0.5rem;
}

.timkiemchuyenbay__phantu:first-child {
	margin-left: 20px;
}

.timkiemchuyenbay__phantu select {
	width: 100%;
	padding-bottom: 8px;
	margin-right: 10px;
	border: none;
	outline: none;
	border-radius: 0.5rem;
	width: fit-content;
}
</style>
<body>
	<jsp:include page="includes-admin/navbar-admin.jsp"></jsp:include>
	
	<!-- chọn chuyến bay-->
        <div class="container-fluid quanlychuyenbay">
			<!-- Modal xóa chuyến bay -->
             <div class="modal fade" id="xoachuyenbay" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <form action="#" method="post">
	                    <div class="themchuyenbay">
	                        <div class="themchuyenbay-title" style="color: red;">
	                            Bạn Xác Nhận Vô Hiệu Hóa Tài Khoản Này?
	                        </div>
	                        <div class="vungchua__themchuyenbay">
	                                <div class="themchuyenbay__phantu">
	                                    <div class="label"><label for="MaCBXoa">Mã Khách hàng</label></div>
	                                    <input type="text" id="MaCBXoa" class="macbXoa" readonly>
	                                </div>
	                        </div>
	                        <div class="modal-footer chantrangxoachuyen">
	                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
	                            <button type="submit" class="btn btn-primary _btnChuyenTiep btnxacnhanxoachuyen">Xác Nhận</button>
	                        </div>
	                    </div>
                	</form>
                </div>
            </div>
            <!--/. kết thúc Modal xóa chuyến bay -->
            
            <div >
                <!-- thanh tiêu đề trang chọn chuyến bay-->
                <div class="row">
                    <div class="col-xs-12  col-md-12 " >
                        <div class="quanlychuyenbay--title" style="margin-top: 40px;" >
                            <span>Quản lý Tài Khoản Khách Hàng</span>
                        </div>
                    </div>
                </div>
                  <!-- /. kết thúc thanh tiêu đề trang chọn chuyến bay-->

                <div class="vungchua1">
                    <!-- thanh tìm kiếm chuyến bay-->
                    <form action="<%= url%>/admin-controller" class="timkiemchuyenbay timkiemchuyenbay--quanlychuyen">
                    	<input type="hidden" name="hanhDong" value="tim-kiem-khachhang">
                        <div class="timkiemchuyenbay__phantu" >
                            <input type="text" name="input_search-staff" class="input__machyen" placeholder="Nhập..." id="timkiemchuyenMa">
                        </div>
                        <div class="timkiemchuyenbay__phantu" >
	                        <select name="sapxep-staff">
	                        	<option value="1">Tất cả</option>
	                        	<option value="2">Họ và tên</option>
	                        	<option value="3">Email</option>
	                        	<option value="4">Địa chỉ</option>
	                        </select>	
                        </div>
                            <button type="submit" class="timkiemchuyenbay__phantu timkiemchuyenbay__phantu--btnTimChuyenBay" onclick="return hamkiemtratimkiemchuyen('timkiemchuyenMa','timkiemchuyendate')" style="padding: 5px 10px;"> Tìm kiếm</button>
                    </form>
                </div>


                <div class="row box-flight-list">
                    <!-- box danh sách chuyến bay đi và bay về-->
                    <div class="flight-list col-xs-12  col-md-12 ">
                        <div class="box-flight-list ">
                            <div class="flight-list-header box-quanlychuyenbay ">
                                <div class="flight-list-header__item ">Mã Nhân viên</div>
                                <div class="flight-list-header__item msb">Mã Tài Khoản</div>
                                <div class="flight-list-header__item">Họ tên</div>
                                <div class="flight-list-header__item">Ngày sinh</div>
                                <div class="flight-list-header__item">Số điện thoại</div>
                                <div class="flight-list-header__item">Email</div>
                                <div class="flight-list-header__item">Địa chỉ</div>
                                <div class="flight-list-header__item">Giới tính</div>
                                 <div class="flight-list-header__item">Tác vụ</div>
                            </div>
                            <div class="flight-lists  box-quanlychuyenbay ">
                            <%
                    		if (allKhachHang == null) {
                    			allKhachHang = new ArrayList<KhachHang>();
                    		}
                    		for (KhachHang n : allKhachHang) {
                            %>
                            	<div class="flight-item  quanlychuyen-item">
                                    <div class=" quanlychuyen-option" >
                                        <div class="quanlychuyen-option-item"><%= n.getMaKhachHang() %></div>
                                        <div class="quanlychuyen-option-item mscb"><%= n.getMaTaiKhoan() %></div>
                                        <div class="quanlychuyen-option-item"><%= n.getHoVaTen() %></div>
                                        <div class="quanlychuyen-option-item"><%= n.getNgaySinh() %></div>
                                        <div class="quanlychuyen-option-item"><%= n.getEmail() %></div>
                                        <div class="quanlychuyen-option-item"><%= n.getSoDienThoai() %></div>
                                        <div class="quanlychuyen-option-item"><%= n.getDiaChi() %></div>
                                        <div class="quanlychuyen-option-item"><%= n.isGioiTinh() ? "Nam" : "Nữ" %></div>
                                        
                                        <div class="quanlychuyen-option-item quanlychuyen-option-item-tacvu">
                                        	<button type="button" class="btnTacVu btn__xoachuyen" data-toggle="modal" data-target="#xoachuyenbay" style="border: none;">
                                        		<i class="fa-solid fa-ban"></i>
                                        	</button>
                                        </div>
                                    </div>
                                </div>
                            <% 
                                }
                            %>
                            </div>
                        </div> 
                    </div>
                     <!-- /. kết thúc box danh sách chuyến bay đi và bay về-->

            </div>
        </div>
    </div>
	
	<jsp:include page="includes-admin/footer-staff.jsp"></jsp:include>
</body>
<script>
document.addEventListener("DOMContentLoaded", function() {
    var btnTacVuList = document.querySelectorAll('.btn__suathongtinchuyen'); // Thay đổi .btnTacVu thành .btn__suathongtinchuyen
    btnTacVuList.forEach(function(btnTacVu) {
        btnTacVu.addEventListener('click', function() {
            // Lấy mã chuyến bay từ phần tử HTML tương ứng
            var maChuyenBay = this.closest('.quanlychuyen-option').querySelector('.mscb').innerText;
            // Đặt mã chuyến bay vào input trong modal
            document.getElementById('MaCBChinhSua').value = maChuyenBay;
        });
    });
    
    var btnXoaList = document.querySelectorAll('.btn__xoachuyen');
    btnXoaList.forEach(function(btnXoa) {
        btnXoa.addEventListener('click', function() {
            // Lấy mã chuyến bay từ phần tử HTML tương ứng
            var maChuyenBay = this.closest('.quanlychuyen-option').querySelector('.mscb').innerText;
            // Đặt mã chuyến bay vào input trong modal
            document.getElementById('MaCBXoa').value = maChuyenBay;
        });
    });
    
});
</script>
</html>