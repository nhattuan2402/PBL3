<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
NhanVien nhanVien = (NhanVien)session.getAttribute("nhanVien");

if (nhanVien != null) {
	request.setAttribute("nhanvien", nhanVien);
} else {
    response.sendRedirect(url + "/index.jsp");
} 

ArrayList<TuyenBay> allTuyenBay = (ArrayList<TuyenBay>)session.getAttribute("allTuyenBay");
ArrayList<MayBay> allMayBay = (ArrayList<MayBay>)session.getAttribute("allMayBay");
ArrayList<LichBay> allLichBay = (ArrayList<LichBay>)session.getAttribute("allLichBay");
%>
<title>Quản lý chuyến bay</title>	
<jsp:include page="includes-staff/header-staff.jsp"></jsp:include>
</head>
<style>
.quanlychuyenbay {
	margin-top: 40px;
}
</style>
<body>
	<jsp:include page="includes-staff/navbar-staff.jsp"></jsp:include>
 		<!-- chọn chuyến bay-->
        <div class="container quanlychuyenbay">
			<!-- Modal xóa chuyến bay -->
             <div class="modal fade" id="xoachuyenbay" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <form action="#" method="post">
	                    <div class="themchuyenbay">
	                        <div class="themchuyenbay-title" style="color: red;">
	                            Bạn Xác Nhận Vô Hiệu Hóa Chuyến Bay!
	                        </div>
	                        <div class="vungchua__themchuyenbay">
	                                <div class="themchuyenbay__phantu">
	                                    <div class="label"><label for="MaCBXoa">Mã Chuyến Bay</label></div>
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
            
            <!-- Modal sửa chuyến bay -->
             <div class="modal fade" id="suachuyenbay" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <form action="<%= url%>/nhan-vien-controller" method="post">
                    <input type="hidden" name="hanhDong" value="update-chuyenbay">
                    <div class="themchuyenbay">
                        <div class="themchuyenbay-title">
                            Sửa Chuyến Bay
                        </div>
                        <div class="vungchua__themchuyenbay">
                            <div class="themchuyenbay__dong">
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="MaCBChinhSua">Mã Chuyến Bay</label></div>
                                    <input type="text" id="MaCBChinhSua" class="macbChinhsua" readonly>
                                </div>
                            </div>
                            <div class="themchuyenbay__dong">
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="ngaybaychuyenbaychinhsua">Ngày Bay</label></div>
                                    <input type="date" id="ngaybaychuyenbaychinhsua" >
                                    <div class="warning"></div>
                                </div>
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="giobaychuyenbaychinhsua">Lịch Bay</label></div>
                                    <select class="theselect--themchuyenbay"id="lichbaychinhsua">
                                        <option value="hcm">7:00 AM</option>
                                        <option value="sg">7:00 AM</option>
                                        <option value="dn">7:00 AM</option>
                                    </select>
                                </div>
                            </div>
                            <div class="themchuyenbay__dong">
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="diemdichuyenbaychinhsua">Tuyến bay</label></div>
                                    <select class="theselect--themchuyenbay" id="diemdichuyenbaychinhsua">
                                        <option selected value="hcm">hcm</option>
                                        <option value="sg">hc</option>
                                        <option value="dn">cm</option>
                                    </select>
                                </div>
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="loaimaybaychuyenbaychinhsua">Loại Máy Bay</label></div>
                                    <select class="theselect--themchuyenbay" id="loaimaybaychuyenbaychinhsua">
                                        <option selected value="hcm">A321</option>
                                        <option value="sg">A320</option>
                                    </select>
                                </div>
                            </div>
                            <div class="themchuyenbay__dong">
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="soghechuyenbaychinhsua">Số Ghế</label></div>
                                    <select class="theselect--themchuyenbay" id="soghechuyenbaychinhsua">
                                        <option selected value="hcm">118</option>
                                        <option value="sg">210</option>
                                        <option value="dn">108</option>
                                    </select>
                                </div>
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="giaChuyenchinhsua">Giá Chuyến</label></div>
                                    <input type="text"  id="giaChuyenchinhsua" placeholder="Giá chuyến?">
                                    <div class="warning"></div>
                                </div>
                            </div>
                            <button type="submit" class="_btnChuyenTiep btnthemchuyenbay" onclick="return kiemtradauvaoThemChuyenBay('giaChuyenchinhsua','ngaybaychuyenbaychinhsua')">Xác Nhận</button>
                        </div>
                    </div>
                </form>
                </div>
            </div>
            <!--/. kết thúc Modal sửa chuyến bay -->
            <!-- Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <form action="<%=url%>/nhan-vien-controller?hanhDong=them-chuyen-bay" method="post">
                    <input type="hidden" name="hanhDong" value ="them-chuyen-bay">
                    <div class="themchuyenbay">
                        <div class="themchuyenbay-title">
                            Thêm Chuyến Bay
                        </div>
                        <div class="vungchua__themchuyenbay">
                            <div class="themchuyenbay__dong">
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="ngaybaychuyenbay">Ngày Bay</label></div>
                                    <input name="ngayBayMoi" type="date" id="ngaybaychuyenbay" >
                                    <div class="warning"></div>
                                </div>
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="giobaychuyenbay">Lịch Bay</label></div>
                                    <select name="lichBayMoi" class="theselect--themchuyenbay">
                                    <%
                                    	for (LichBay l : allLichBay) {
                                    %>
                                        <option value=<%= l.getMaLichBay() %>><%= l.getThoiGianCatCanh() %></option>
                                    <% } %>
                                    </select>
                                </div>
                            </div>
                            <div class="themchuyenbay__dong">
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="diemdichuyenbay">Tuyến bay</label></div>
                                    <select name="tuyenBayMoi" class="theselect--themchuyenbay" id="diemdichuyenbay">
                                    <%
                                    	for (TuyenBay t : allTuyenBay) {
                                    %>
                                        <option value=<%= t.getMaTuyenBay() %>><%= t.getNoiCatCanh() %> đến <%= t.getNoiHaCanh()%></option>
                                    <% } %>
                                    </select>
                                </div>
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="loaimaybaychuyenbay">Loại Máy Bay</label></div>
                                    <select name="maMayBayMoi" class="theselect--themchuyenbay" id="loaimaybaychuyenbay">
                                        <%
                                        	for (MayBay m : allMayBay) {
                                        %>
                                        <option value=<%= m.getMaMayBay() %>><%= m.getLoaiMayBay() %></option>
                                        <% } %>
                                    </select>
                                </div>
                            </div>
                            <div class="themchuyenbay__dong">
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="soghechuyenbay">Số Ghế</label></div>
                                    <select class="theselect--themchuyenbay" id="soghechuyenbay">
                                    <%
                                    	for (MayBay m : allMayBay) {
                                    %>
                                        <option selected value="hcm">123</option>
                                    <% } %>
                                    </select>
                                </div>
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="giaChuyen">Giá Chuyến</label></div>
                                    <input  name="giaMoi" type="text"  id="giaChuyen" placeholder="Giá chuyến?">
                                    <div class="warning"></div>
                                </div>
                            </div>
                            <button type="submit" class="_btnChuyenTiep btnthemchuyenbay" onclick="return kiemtradauvaoThemChuyenBay('giaChuyen','ngaybaychuyenbay')">Thêm Chuyến Bay</button>
                        </div>
                    </div>
                </form>
                </div>
            </div>

            
            <div >
                <!-- thanh tiêu đề trang chọn chuyến bay-->
                <div class="row">
                    <div class="col-xs-12  col-md-12 " >
                        <div class="quanlychuyenbay--title   " >
                            <span >Quản lý chuyến bay</span>
                        </div>
                    </div>
                </div>
                  <!-- /. kết thúc thanh tiêu đề trang chọn chuyến bay-->

                <div class="vungchua1">
                    <!-- thanh tìm kiếm chuyến bay-->
                    <form action="<%= url%>/nhan-vien-controller" class="timkiemchuyenbay timkiemchuyenbay--quanlychuyen">
                    	<input type="hidden" name="hanhDong" value="tim-kiem-cb">
                        <div class="timkiemchuyenbay__phantu" >
                            <input type="text" name="input__machyen" class="input__machyen" placeholder="Mã Chuyến Bay?" id="timkiemchuyenMa">
                        </div>

                        <div class="timkiemchuyenbay__phantu" >
                            <input type="date" name="input_thoigian" id="timkiemchuyendate">
                        </div>
                            <button type="submit" class="timkiemchuyenbay__phantu timkiemchuyenbay__phantu--btnTimChuyenBay" onclick="return hamkiemtratimkiemchuyen('timkiemchuyenMa','timkiemchuyendate')" style="padding: 5px 10px;"> Tìm kiếm</button>
                    </form>
                    <!-- /. kết thúc thanh tìm kiếm chuyến bay-->
                    <button type="button" class="btn btn-primary btn_themchuyenbay" data-toggle="modal" data-target="#exampleModalCenter">+ Thêm chuyên bay</button>
                </div>


                <div class="row box-flight-list">
                    <!-- box danh sách chuyến bay đi và bay về-->
                    <div class="flight-list col-xs-12  col-md-12 ">
                        <div class="box-flight-list ">
                            <div class="flight-list-header box-quanlychuyenbay ">
                                <div class="flight-list-header__item ">Mã Chuyến Bay</div>
                                <div class="flight-list-header__item ">Giờ Bay</div>
                                <div class="flight-list-header__item ">Ngày Bay</div>
                                <div class="flight-list-header__item">Điểm Đi</div>
                                <div class="flight-list-header__item">Điểm Đến</div>
                                <div class="flight-list-header__item">Loại Máy Bay</div>
                                <div class="flight-list-header__item">Số Ghế</div>
                                <div class="flight-list-header__item">Tác Vụ</div>
                            </div>
                            <div class="flight-lists  box-quanlychuyenbay ">
                            <%
                            ArrayList<ChuyenBay> allChuyenBay = (ArrayList<ChuyenBay>)session.getAttribute("allChuyenBay");
                    		if (allChuyenBay == null) {
                    			response.sendRedirect(url + "/index.jsp");
                    		}
                    		for (ChuyenBay c : allChuyenBay) {
                            %>
                            	<div class="flight-item  quanlychuyen-item">
                                    <div class=" quanlychuyen-option" >
                                        <div class="quanlychuyen-option-item mscb"><%= c.getMaChuyenBay() %></div>
                                        <div class="quanlychuyen-option-item "><%= c.getGioBay() %> AM</div>
                                        <div class="quanlychuyen-option-item "><%= c.getNgayBay() %></div>
                                        <div class="quanlychuyen-option-item"><%= c.getDiemDen() %></div>
                                        <div class="quanlychuyen-option-item"><%= c.getDiemDi() %></div>
                                        <div class="quanlychuyen-option-item"><%= c.getMaMayBay() %></div>
                                        <div class="quanlychuyen-option-item">118</div>
                                        <div class="quanlychuyen-option-item quanlychuyen-option-item-tacvu">
                                        	<button type="button" class="btnTacVu btn__xoachuyen" data-toggle="modal" data-target="#xoachuyenbay" style="border: none;">
                                        		<i class="fa-solid fa-ban"></i>
                                        	</button>
                                        	<button type="button" class="btnTacVu btn__suathongtinchuyen" data-toggle="modal" data-target="#suachuyenbay" style="border: none;">
                                        		<i class="fa-regular fa-pen-to-square"></i>
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
    <!-- /. kết thuc trang chon chuyen-->

<!--/. Kết thúc phần tìm chuyến và chọn chuyến-->
	<jsp:include page="includes-staff/footer-staff.jsp"></jsp:include>
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