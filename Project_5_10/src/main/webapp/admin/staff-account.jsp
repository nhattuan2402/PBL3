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

ArrayList<NhanVien> allNhanVien = (ArrayList<NhanVien>)session.getAttribute("allNhanVien");
if (allNhanVien == null) {
	response.sendRedirect(url + "/index.jsp");
	return;
} 
%>
<title>QL Nhân viên</title>
<jsp:include page="includes-admin/header-admin.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="includes-admin/navbar-admin.jsp"></jsp:include>
	
	<!-- chọn chuyến bay-->
        <div class="container quanlychuyenbay">
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
	                                    <div class="label"><label for="MaCBXoa">Mã Nhân viên</label></div>
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
            
            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <form action="<%=url%>/admin-controller" method="post">
                    <input type="hidden" name="hanhDong" value ="them-tuyen-bay">
                    <div class="themchuyenbay">
                        <div class="themchuyenbay-title">
                            Thêm Nhân viên
                        </div>
                        <div class="vungchua__themchuyenbay">
                            <div class="themchuyenbay__dong">
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="giaChuyen">Điểm đi</label></div>
                                    <input  name="new-chuyenDi" type="text"  id="giaChuyen giaChuyenDi" placeholder="Điểm đi ...">
                                    <div class="warning"></div>
                                </div>
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="giaChuyen">Điểm đến</label></div>
                                    <input  name="new-chuyenDen" type="text"  id="giaChuyen giaChuyenDen" placeholder="Điểm đến ...">
                                    <div class="warning"></div>
                                </div>
                            </div>
                            <div class="themchuyenbay__dong">
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="giaChuyen">Thời gian</label></div>
                                    <input  name="new-GiaMoi" type="text"  id="giaChuyen giaChuyenThoiGian" placeholder="Thời gian tuyến bay">
                                    <div class="warning"></div>
                                </div>
                            </div>
                            <button type="submit" class="_btnChuyenTiep btnthemchuyenbay" onclick="return kiemTraGiaChuyen('giaChuyenDi', 'giaChuyenDen', 'giaChuyenThoiGian')">Thêm Nhân Viên</button>
                        </div>
                    </div>
                </form>
                </div>
            </div>

            
            <div >
                <!-- thanh tiêu đề trang chọn chuyến bay-->
                <div class="row">
                    <div class="col-xs-12  col-md-12 " >
                        <div class="quanlychuyenbay--title" style="margin-top: 40px;" >
                            <span>Quản lý Nhân viên</span>
                        </div>
                    </div>
                </div>
                  <!-- /. kết thúc thanh tiêu đề trang chọn chuyến bay-->

                <div class="vungchua1">
                    <!-- thanh tìm kiếm chuyến bay-->
                    <form action="<%= url%>/admin-controller" class="timkiemchuyenbay timkiemchuyenbay--quanlychuyen">
                    	<input type="hidden" name="hanhDong" value="tim-kiem-tuyen">
                        <div class="timkiemchuyenbay__phantu" >
                            <input type="text" name="input__diemdi-new" class="input__machyen" placeholder="Mã Chuyến Đi?" id="timkiemchuyenMa">
                        </div>

                        <div class="timkiemchuyenbay__phantu" >
                             <input type="text" name="input__diemden-new" class="input__machyen" placeholder="Mã Chuyến Đến?" id="timkiemchuyenMa">
                        </div>
                            <button type="submit" class="timkiemchuyenbay__phantu timkiemchuyenbay__phantu--btnTimChuyenBay" onclick="return hamkiemtratimkiemchuyen('timkiemchuyenMa','timkiemchuyendate')" style="padding: 5px 10px;"> Tìm kiếm</button>
                    </form>
                    <!-- /. kết thúc thanh tìm kiếm chuyến bay-->
                    <button type="button" class="btn btn-primary btn_themchuyenbay" data-toggle="modal" data-target="#exampleModalCenter">+ Thêm nhân viên</button>
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
                                <div class="flight-list-header__item">Email</div>
                                <div class="flight-list-header__item">Số điện thoại</div>
                                <div class="flight-list-header__item">Địa chỉ</div>
                                <div class="flight-list-header__item">Giới tính</div>
                                 <div class="flight-list-header__item">Tác vụ</div>
                            </div>
                            <div class="flight-lists  box-quanlychuyenbay ">
                            <%
                    		if (allNhanVien == null) {
                    			allNhanVien = new ArrayList<NhanVien>();
                    		}
                    		for (NhanVien n : allNhanVien) {
                            %>
                            	<div class="flight-item  quanlychuyen-item">
                                    <div class=" quanlychuyen-option" >
                                        <div class="quanlychuyen-option-item"><%= n.getMaNhanVien() %></div>
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