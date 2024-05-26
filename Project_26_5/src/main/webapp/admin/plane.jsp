<%@page import="java.util.ArrayList"%>
<%@page import="model.*"%>
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

ArrayList<MayBay> allMayBay = (ArrayList<MayBay>)session.getAttribute("allMayBay");
if (allMayBay == null) {
	response.sendRedirect(url + "/index.jsp");
	return;
} 
%>
<title>Admin Page</title>
<jsp:include page="includes-admin/header-admin.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="includes-admin/navbar-admin.jsp"></jsp:include>
	<div class = "container">
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <form action="<%=url%>/admin-controller" method="post">
                    <input type="hidden" name="hanhDong" value ="them-nhan-vien">
                    <div class="themchuyenbay">
                        <div class="themchuyenbay-title">
                            Thêm Máy Bay
                        </div>
                        <div class="vungchua__themchuyenbay">
                            <div class="themchuyenbay__dong">
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="giaChuyen">Loại Máy Bay</label></div>
                                    <input  name="new-name" type="text"  id="giaChuyen" placeholder="Loại Máy Bay" required>
                                    <div class="warning"></div>
                                </div>
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="giaChuyen">Số ghế thương gia</label></div>
                                    <input  name="new-birth" type="text"  id="giaChuyen" placeholder="Số ghế thương gia" required>
                                    <div class="warning"></div>
                                </div>
                            </div>
                            <div class="themchuyenbay__dong">
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="giaChuyen">Số cột thương gia</label></div>
                                    <input  name="new-email" type="text"  id="giaChuyen" placeholder="Số cột thương gia" required>
                                    <div class="warning"></div>
                                </div>
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="giaChuyen">Số ghế phổ thông 1</label></div>
                                    <input  name="new-email" type="text"  id="giaChuyen" placeholder="Số ghế phổ thông 1" required>
                                    <div class="warning"></div>
                                </div>
                            </div>
                            <div class="themchuyenbay__dong">
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="giaChuyen">Số ghế phổ thông 2</label></div>
                                    <input  name="new-address" type="text"  id="giaChuyen" placeholder="Số ghế phổ thông 2" required>
                                    <div class="warning"></div>
                                </div>
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="giaChuyen">Số ghế phổ thông 3</label></div>
                                    <input  name="new-address" type="text"  id="giaChuyen" placeholder="Số ghế phổ thông 3" required>
                                    <div class="warning"></div>
                                </div>
                            </div>
                            <div class="themchuyenbay__dong">
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="giaChuyen">Số cột phổ thông</label></div>
                                    <input  name="new-address" type="text"  id="giaChuyen" placeholder="Số cột phổ thông" required>
                                    <div class="warning"></div>
                                </div>
                            </div>
                            <button type="submit" class="_btnChuyenTiep btnthemchuyenbay" onclick="return kiemTraGiaChuyen('giaChuyenDi', 'giaChuyenDen', 'giaChuyenThoiGian')">Thêm Máy Bay</button>
                        </div>
                    </div>
                </form>
                </div>
            </div>
            
            <div class="vungchua1">
                    <!-- thanh tìm kiếm chuyến bay-->
                    <form action="<%= url%>/admin-controller" class="timkiemchuyenbay timkiemchuyenbay--quanlychuyen">
                    	<input type="hidden" name="hanhDong" value="tim-kiem-maybay">
                        <div class="timkiemchuyenbay__phantu" >
                            <input type="text" name="input_search-staff" class="input__machyen" placeholder="Nhập..." id="timkiemchuyenMa">
                        </div>
                        <div class="timkiemchuyenbay__phantu" >
	                        <select name="sapxep-staff">
	                        	<option value="1">Tất cả</option>
	                        	<option value="1">Loại</option>
	                        </select>	
                        </div>
                            <button type="submit" class="timkiemchuyenbay__phantu timkiemchuyenbay__phantu--btnTimChuyenBay" onclick="return hamkiemtratimkiemchuyen('timkiemchuyenMa','timkiemchuyendate')" style="padding: 5px 10px;"> Tìm kiếm</button>
                    </form>
                    <!-- /. kết thúc thanh tìm kiếm chuyến bay-->
                    <button type="button" class="btn btn-primary btn_themchuyenbay" data-toggle="modal" data-target="#exampleModalCenter">+ Thêm máy bay</button>
                </div>


                <div class="row box-flight-list">
                    <!-- box danh sách chuyến bay đi và bay về-->
                    <div class="flight-list col-xs-12  col-md-12 ">
                        <div class="box-flight-list ">
                            <div class="flight-list-header box-quanlychuyenbay ">
                                <div class="flight-list-header__item ">Mã Máy bay</div>
                                <div class="flight-list-header__item msb">Loại Máy bay</div>
                                <div class="flight-list-header__item">Số ghê TG</div>
                                <div class="flight-list-header__item">Số cột TG</div>
                                <div class="flight-list-header__item">Số ghế PT 1</div>
                                <div class="flight-list-header__item">Số ghế PT 2</div>
                                <div class="flight-list-header__item">Số ghế PT 3</div>
                                <div class="flight-list-header__item">Số cột phổ thông</div>
                                <div class="flight-list-header__item">Tác vụ</div>
                            </div>
                            <div class="flight-lists  box-quanlychuyenbay ">
                            <%
                    		if (allMayBay == null) {
                    			allMayBay = new ArrayList<MayBay>();
                    		}
                    		for (MayBay n : allMayBay) {
                            %>
                            	<div class="flight-item  quanlychuyen-item">
                                    <div class=" quanlychuyen-option" >
                                        <div class="quanlychuyen-option-item"><%= n.getMaMayBay() %></div>
                                        <div class="quanlychuyen-option-item mscb"><%= n.getLoaiMayBay() %></div>
                                        <div class="quanlychuyen-option-item"><%= n.getSoGheThuongGia() %></div>
                                        <div class="quanlychuyen-option-item"><%= n.getSoCotThuongGia() %></div>
                                        <div class="quanlychuyen-option-item"><%= n.getSoGhePhoThong1()%></div>
                                        <div class="quanlychuyen-option-item"><%= n.getSoGhePhoThong2() %></div>
                                        <div class="quanlychuyen-option-item"><%= n.getSoGhePhoThong3() %></div>
                                        <div class="quanlychuyen-option-item"><%= n.getSoCotPhoThong()%></div>
                                        
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
                    </div>
                    </div>
	<jsp:include page="includes-admin/footer-staff.jsp"></jsp:include>
</body>
</html>