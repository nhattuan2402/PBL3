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
}

ArrayList<LichBay> allLichBay = (ArrayList<LichBay>) session.getAttribute("allLichBay");
if (allLichBay == null) {
	response.sendRedirect(url + "/index.jsp");
}
%>
<title>QL Lịch Bay</title>
<jsp:include page="includes-admin/header-admin.jsp"></jsp:include>
</head>
<style>
.themchuyenbay__dong {
    display: grid;
    grid-template-columns: repeat(1, 1fr);
    gap: 8px;
}
</style>
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
	                            Bạn Xác Nhận Vô Hiệu Lịch Bay!
	                        </div>
	                        <div class="vungchua__themchuyenbay">
                                <div class="themchuyenbay__phantu" >
                                    <div class="label"><label for="MaCBXoa">Mã Lịch Bay</label></div>
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
                    <input type="hidden" name="hanhDong" value ="them-lich-bay">
                    <div class="themchuyenbay">
                        <div class="themchuyenbay-title">
                            Thêm Tuyến Bay
                        </div>
                        <div class="vungchua__themchuyenbay">
                            <div class="themchuyenbay__dong">
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="giaChuyen">Khung giờ khởi hành</label></div>
                                    <input  name="new-lich-bay" type="time"  id="giaChuyen giaChuyenThoiGian" placeholder="Thời gian khởi hành">
                                    <div class="warning"></div>
                                </div>
                            </div>
                            <button type="submit" class="_btnChuyenTiep btnthemchuyenbay" onclick="return kiemTraGiaChuyen('giaChuyenDi', 'giaChuyenDen', 'giaChuyenThoiGian')">Thêm Tuyến Bay</button>
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
                            <span>Quản lý Lịch bay</span>
                        </div>
                    </div>
                </div>
                  <!-- /. kết thúc thanh tiêu đề trang chọn chuyến bay-->

                <div class="vungchua1">
                    <!-- thanh tìm kiếm chuyến bay-->
                    <form action="<%= url%>/admin-controller" class="timkiemchuyenbay timkiemchuyenbay--quanlychuyen">
                    	<input type="hidden" name="hanhDong" value="tim-kiem-lich-bay">
                       	<select name="sapxep-lich" class="timkiemchuyenbay__phantu" style="padding-bottom: 10px;">
                            <option value="1">Tăng dần theo thời gian</option>
                            <option value="0">Giảm dần theo thời gian</option>
                        </select>
                        <button type="submit" class="timkiemchuyenbay__phantu timkiemchuyenbay__phantu--btnTimChuyenBay" style="padding: 5px 10px;">Sắp xếp</button>
                    </form>
                    <!-- /. kết thúc thanh tìm kiếm chuyến bay-->
                    <button type="button" class="btn btn-primary btn_themchuyenbay" data-toggle="modal" data-target="#exampleModalCenter">+ Thêm tuyến bay</button>
                </div>


                <div class="row box-flight-list">
                    <!-- box danh sách chuyến bay đi và bay về-->
                    <div class="flight-list col-xs-12  col-md-12 ">
                        <div class="box-flight-list ">
                            <div class="flight-list-header box-quanlychuyenbay ">
                                <div class="flight-list-header__item">Mã Lịch bay</div>
                                <div class="flight-list-header__item">Thời gian khởi hành</div>
                                <div class="flight-list-header__item">Tác Vụ</div>
                            </div>
                            <div class="flight-lists  box-quanlychuyenbay ">
                            <%
                    		if (allLichBay == null) {
                    			response.sendRedirect(url + "/index.jsp");
                    		}
                    		for (LichBay l : allLichBay) {
                            %>
							<div class="flight-item  quanlychuyen-item">
                                    <div class=" quanlychuyen-option" >
                                        <div class="quanlychuyen-option-item mscb"><%= l.getMaLichBay() %></div>
                                        <div class="quanlychuyen-option-item"><%= l.getThoiGianCatCanh() %></div>
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