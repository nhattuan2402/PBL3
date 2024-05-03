<%@page import ="model.*" %>
<%@page import="java.util.ArrayList" %>

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
        <script src ="./assets/events/event_index.js"></script>
        <script src ="./assets/events/formdangky.js"></script>
        <script src ="./assets/events/formdangnhap.js"></script>
        <script src ="./assets/events/formhotro.js"></script>
        <script src ="./assets/events/thanhtimkiem.js"></script>
        <script src ="./assets/events/chonchuyenbay.js"></script>

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

        <div class="containber">
           

            <!-- message box-->
            <div class="messagebox warning" id="messagebox_warning">
                <div class="messagebox__bieutuong messagebox__bieutuong--warning">
                    <i class="fa-solid fa-circle-exclamation"></i>
                </div>
                <div class="messagebox__title">
                    Bạn Ơi!
                </div>
                <div class="messagebox__content" id="messagebox_warning-content">
                </div>
            </div>

            <div class="messagebox Congratulations" id="messagebox_Congratulation">
                <div class="messagebox__bieutuong messagebox__bieutuong--Congratulations">
                    <i class="fa-solid fa-circle-check"></i>
                </div>
                <div class="messagebox__title">
                    Bạn Ơi!
                </div>
                <div class="messagebox__content" id="messagebox_Congratulations-content">
                </div>
            </div>
            <!-- ./ kết thúc message box-->
        </div>
        <!-- header-->
   		<jsp:include page="/header.jsp"></jsp:include>	
    	<!--Kết thúc header-->

            <!-- chọn chuyến bay-->
            <div class="trangchonchuyenbay row">
                <div class="container">
                    <!-- thanh tìm kiếm chuyến bay-->
                    <form name="timchuyenbay" action="<%=url%>/khach-hang-controller" method="Post">
                    <input type = "hidden" name ="hanhDong" value ="tim-kiem-chuyen-bay"/>
                    <div class="timkiemchuyenbay slideanim row  ">
                        <div class="timkiemchuyenbay__phantu timkiemchuyenbay--chonThanhPho" >
                            <i class="fa-solid fa-plane-departure"></i>
                            <input type="text" class="timchuyenbay__nhapthanhpho text_demkhoihanh" id="diemKhoiHanh_ThanhTimKiem" placeholder="Điểm khởi hành?" tabindex="0" name ="diemKhoiHanh">
                            <div class="timkiemchuyenbay__phantu-chonThanhPho timkiemchuyenbay__phantu-chonThanhPho--Diemdi">
                                <ul class="timkiemchuyenbay__phantu-list timkiemchuyenbay_thanhphodi">

                                </ul>
                            </div>
                        </div>

                        <div class="timkiemchuyenbay__phantu timkiemchuyenbay--chonThanhPho" >
                            <i class="fa-solid fa-plane-arrival"></i>
                            <input type="text" class="timchuyenbay__nhapthanhpho text_demden" id="diemDen_ThanhTimKiem"  placeholder="Điểm Đến?" name ="diemDen">
                            <div class=" timkiemchuyenbay__phantu-chonThanhPho timkiemchuyenbay__phantu-chonThanhPho--Diemden">
                                <ul class="timkiemchuyenbay__phantu-list timkiemchuyenbay_thanhphoden">
                                    
                                </ul>
                            </div>
                        </div>

                        <div class="timkiemchuyenbay__phantu">
                                <i class="fa-regular fa-calendar"></i>
                                <input type="text" class="btn_lichBay " id="lichBay_ThanhTimKiem"  readonly="readonly" placeholder="Ngày đi - ngày về">
                            <div class="timkiemchuyenbay_phantu__chonlich">
                                <div class="timkiemchuyenbay__chonlich">
                                    <label class="timkiemchuyenbay__chonlich__loaive" for="round-trip" >Khứ hồi</label>
                                    <input class="timkiemchuyenbay__chonlich__loaive" type="radio"  name="loaiVe" value="Khứ hồi" checked="checked" id="radio_round-trip">
                                    <label class="timkiemchuyenbay__chonlich__loaive" for="one-way">Một chiều</label>
                                    <input class="timkiemchuyenbay__chonlich__loaive" type="radio"  name="loaiVe" value="Một chiều" id="radio_one-way">
                                    <input class="chonlich__btnXacnhan" type="button" value="Xác Nhận">
                                </div>
                                <div class="timkiemchuyenbay__chonlich">
                                    <label   class="timkiemchuyenbay__chonlich-chonngay" for="departure-date">Ngày đi:</label>
                                    <input  class="timkiemchuyenbay__chonlich-chonngay"   type="date" id="departure-date" name="departure-date" placeholder="Select Date.." readonly="readonly">
                                </div>
                                <div class="timkiemchuyenbay__chonlich timkiemchuyenbay__chonlich__ngayve">
                                    <label class="timkiemchuyenbay__chonlich-chonngay" for="return-date">Ngày về:</label>
                                    <input class="timkiemchuyenbay__chonlich-chonngay"  type="date" id="return-date" name="return-date" placeholder="Select Date.." readonly="readonly">
                                </div>
                                
                            </div>
                        </div>

                        <div class="timkiemchuyenbay__phantu timkiemchuyenbay__phantu--hienThiSoHanhKhach">
                            <i class="fa fa-user"></i> 
                            <input type="text"  class="HienthiSoHK" id="soHanhKach_ThanhTimKiemChuyenBay" placeholder="1 Người lớn" readonly="readonly" >
                            <input type="hidden"  id="soHanhKach_nguoilon" value="1" >
                            <input type="hidden"  id="soHanhKach_treem" value="0">
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
                                        <div class="timchuyenbay__demsohanhkhach__exit exit"><i class="fa-regular fa-circle-xmark"></i></div>
                                    </table>
                                </div>
                            </div>
                            <input type="hidden" id="diemKhoiHanh">
                            <input type="hidden" id="diemden">
                            <button type="submit" class="timkiemchuyenbay__phantu timkiemchuyenbay__phantu--btnTimChuyenBay" onclick="return timkiemchuyenbay('diemKhoiHanh','diemden','departure-date','return-date','radio_round-trip','soHanhKach_nguoilon','soHanhKach_treem','diemKhoiHanh_ThanhTimKiem','diemDen_ThanhTimKiem')"> Tìm kiếm chuyến bay</button>
                        </div>
                    </form>
                        <!-- /. kết thúc thanh tìm kiếm chuyến bay-->
                     <%
                    	// thông tin của tuyến bay  
                    	Object tbd = session.getAttribute("tuyenBayDi");
		                TuyenBay tuyenBayDi = (TuyenBay) tbd;
		                
		                String loaiVe = "";
		                Object loaiVeObj = session.getAttribute("loaiVe");
		                if (loaiVeObj != null) {
		                	loaiVe = (String) loaiVeObj;
		                }
		                
		                String ngayDi = "";
		                String ngayVe = "";
		                Object ngayDiObj = session.getAttribute("ngayDi");
		                Object ngayVeObj = session.getAttribute("ngayVe");
		                if (ngayDiObj != null) {
		                    ngayDi = (String) ngayDiObj;
		                }
		                if (ngayVeObj != null) {
		                    ngayVe = (String) ngayVeObj;
		                }
		                
		                // lấy danh sách các chuyến bay đi
		                Object chuyenBayDi =  session.getAttribute("chuyenBayDi");
		                Object chuyenBayDiDaLoc =  session.getAttribute("chuyenBayDiDaLoc");
		                
		                // lấy danh sách các chuyến bay về
		                Object chuyenBayVe =  session.getAttribute("chuyenBayVe");
		                Object chuyenBayVeDaLoc =  session.getAttribute("chuyenBayVeDaLoc");
		                
		                // báo lỗi 
                    	String baoLoiDi = request.getAttribute("baoLoiDi")+"";
                    	baoLoiDi = (baoLoiDi.equals("null")|| baoLoiDi == null) ? "" : baoLoiDi;
                    	
                    	String baoLoiVe = request.getAttribute("baoLoiVe")+"";
                    	baoLoiVe = (baoLoiVe.equals("null")|| baoLoiVe == null) ? "" : baoLoiVe;
                    	
                    	ArrayList<ChuyenBay> danhSachChuyenBayDi = null;
		            	if( chuyenBayDiDaLoc!= null) {
		            		danhSachChuyenBayDi =(ArrayList<ChuyenBay>)chuyenBayDiDaLoc;
		            	} else if(chuyenBayDi != null) {
		            		danhSachChuyenBayDi =(ArrayList<ChuyenBay>) chuyenBayDi;
		            	}
		            	
		            	ArrayList<ChuyenBay> danhSachChuyenBayVe = null;
		            	if( chuyenBayVeDaLoc!= null) {
		            		danhSachChuyenBayVe =(ArrayList<ChuyenBay>)chuyenBayVeDaLoc;
		            	} else if(chuyenBayVe != null) {
		            		danhSachChuyenBayVe =(ArrayList<ChuyenBay>) chuyenBayVe;
		            	}
		            	
                     %>
                    <div class="thongtinhanhtrinh row ">
                        <div class="thongtinhanhtring-colum thongtinhanhtrinh--tieude row">
                            <div class="thongtinhanhtrinh-tieude thongtinhanhtrinh-tieude--phancach" id="loaichuyenbay__thongtinhanhtrinh">Chuyến bay <%=loaiVe%></div>
                            <div class="thongtinhanhtrinh-tieude"><span id="songuoilon__thongtinhanhtrinh">1</span> <span>Người lớn  </span ><span id="sotreem__thongtinhanhtrinh">0</span><span class='thongtinhanhtrinh-tieude--phancach'>Trẻ em</span></div>
                            <div class="thongtinhanhtrinh-tieude chonchuyendi" id="ngaydi__thongtinhanhtrinh"><%=ngayDi%></div>
                            <div class="thongtinhanhtrinh-tieude chonchuyenve" id="ngayve__thongtinhanhtrinh"><%=ngayVe%></div>
                        </div>
                        <div class="thongtinhanhtring-colum row ">
                            <div class="thongtinhanhtrinh-tenTP" id="diemdi__thongtinhanhtrinh"><%=tuyenBayDi.getNoiCatCanh()%></div>
                            <div class="icon chonchuyendi"><i class="fa-solid fa-plane"></i></div>
                            <div class="icon chonchuyenve"><i class="fa-solid fa-plane fa-rotate-180"></i></div>
                            <div class="thongtinhanhtrinh-tenTP" id="diemden__thongtinhanhtrinh"><%=tuyenBayDi.getNoiHaCanh()%></div>
                        </div>
                    </div>  
                    
                    <!-- Filter bar -->
                    <form action="<%=url%>/khach-hang-controller" method = "POST">
						<input type = "hidden" name ="hanhDong" value ="loc-chuyen-bay"/>	
	                    <div class="filter-bar row row col-xs-12  col-md-7">
	                        <label for="price-filter"  class="filter-bar__item">Giá:</label>
	                        <select id="price-filter" class="filter-bar__item item-select" name = "price">
	                            <option value="economy">Thấp nhất</option>
	                            <option value="business">Cao nhất</option>
	                        </select>
	                        <label for="time-filter"  class="filter-bar__item">Thời gian:</label>
	                        <select id="time-filter" class="filter-bar__item item-select" name = "time">
	                            <option value="all">Tất cả</option>
	                            <option value="morning">Buổi sáng</option>
	                            <option value="afternoon">Buổi chiều</option>
	                            <option value="evening">Buổi tối</option>
	                        </select>
	                    	<button type=submit class="timkiemchuyenbay__phantu timkiemchuyenbay__phantu--btnTimChuyenBay " style ="margin: 0 50px">
	                        	Lọc
	                		</button>
	                    </div>
                    </form>
                    <!-- /.End Filter bar -->

                    <!-- thanh tiêu đề trang chọn chuyến bay-->
                    <div class="row ">
                        <div class="col-xs-12  col-md-7 " >
                            <div class="title row chonchuyendi" >
                                <span >Chọn chuyến bay đi dành cho bạn!</span>
                            </div>
                            <div class="title row chonchuyenve" >
                                <span >Chọn chuyến bay về dành cho bạn!</span>
                            </div>
                        </div>
                    </div>
                      <!-- /. kết thúc thanh tiêu đề trang chọn chuyến bay-->
                
                    <div class="row">
                   
                        <!-- box danh sách chuyến bay đi và bay về-->
                        <div class="flight-list col-xs-12  col-md-7 ">
                            <div class="box-flight-list">
                                <div class="flight-list-header row">
                                    <div class="flight-list-header__item ">Thời gian bay</div>
                                    <div class="flight-list-header__item" >Thời Gian Khởi Hành</div>
                                    <div class="flight-list-header__item">Mã Chuyến Bay</div>
                                    <div class="flight-list-header__item">Giá</div>
                                </div>
                                
                                <!-- chuyến bay đi -->
                                <ul class="flight-lists row chonchuyendi">
                                 <%
                                 	if(!baoLoiDi.equals("")) {
                                 %>
                                 		<li class="flight-item " style="color: red"><div class="flight-option" ><%=baoLoiDi%></div></li>
                                 <% 
                                 	} else {
                    					for(ChuyenBay cb : danhSachChuyenBayDi) {
                   				 %>
                                
                                    <li class="flight-item chuyenbaydi" tabindex="0">
                                        <div class="flight-option" >
                                            <div class="flight-item__content " id="flight-option__thoigianbay"><%=tuyenBayDi.getThoiGianBay()%> h</div>
                                            <div class="flight-item__content" id="flight-option__thoigiandi-den"><%=cb.getGioBay() %></div>
                                            <div class="flight-item__content required" id="flight-option__maCB"><%=cb.getMaChuyenBay() %></div>
                                            <div class="fare-options "><span id="flight-option__gia"><%=cb.getGia()%></span>.000VND</div>
                                        </div>
                                    </li>
                                    
                                 <%}}%>
                                </ul>
                                <!-- hết chuyến bay đi -->
                                
                                <%
                                	// hiển thị chuyến bay về
                                %>
                                <!-- chuyến bay về -->
                                <ul class="flight-lists row chonchuyenve ">
                                <%
                                 	if(!baoLoiVe.equals("")|| danhSachChuyenBayVe==null) {
                                 %>
                                 		<li class="flight-item " style="color: red"><div class="flight-option" >Không tìm thấy chuyến bay phù hợp</div></li>
                                 <% 
                                 	} else {
                    					for(ChuyenBay cb : danhSachChuyenBayVe) {
                   				 %>
                                    <li class="flight-item chuyenbayve" tabindex="0">
                                        <div class="flight-option" >
                                            <div class="flight-item__content " id="flight-option__thoigianbay"><%=tuyenBayDi.getThoiGianBay() %></div>
                                            <div class="flight-item__content" id="flight-option__thoigiandi-den"><%=cb.getGioBay() %></div>
                                            <div class="flight-item__content required" id="flight-option__maCB"><%=cb.getMaChuyenBay() %></div>
                                            <div class="fare-options "><span id="flight-option__gia"><%=cb.getGia() %></span>.000VND</div>
                                        </div>
                                    </li>
                                  <%}} %>
                                </ul>
                            </div> 
                        </div>
                        <!-- hết chuyến bay về -->
                    <!-- /. kết thúc box danh sách chuyến bay đi và bay về-->

                    <!-- box chuyen bay được chọn-->
                    <div class="col-xs-12  col-md-5">
                        <div class="chyenbayduocchon">
                            <div class="chyenbayduocchon__chuyenbay trangDienThongTinHanhKhach__muavemaybay" id="chuyenbayduocchon__chuyendi">
                                <div class="chyenbayduocchon__title">
                                    Chuyến Đi
                                </div>
                                <div class="chyenbayduocchon__chitietchuyenbay">
                                    <div class="chyenbayduocchon__item">
                                        <div class="chyenbayduocchon__item__part">
                                            <span class="required" id="chuyendi__macb"></span>
                                        </div>
                                        <div class="chyenbayduocchon__item__part chyenbayduocchon__item__part--text-align-right">
                                            <span class="chyenbayduocchon-thongtin" id="chuyendi__ngaybay"> </span>
                                            <br>
                                            <span class="chyenbayduocchon-thongtin" id="chuyendi__giobay"> </span>
                                            <br>
                                            <span class="chyenbayduocchon-thongtin" id="chuyendi__lichbay"> </span>
                                            <br>
                                            <span class="chyenbayduocchon-thongtin color-grey" id="chuyendi__hanhtrinhbay"></span>
                                        </div>
                                    </div>
                                    <div class="chyenbayduocchon__item">
                                        <div class="chyenbayduocchon__item__part"></div>
                                        <div class="chyenbayduocchon__item__part">
                                            <div class="thongtinchitietgiave-item">
                                                <div class="thongtinchitietgiave-title">
                                                    Giá vé :
                                                </div>
                                                <div class="thongtinchitietgave-giave" ><span id="chuyendi__giave"></span>.000VND</div>
                                            </div>
                                            <div class="thongtinchitietgiave-item">
                                                <div class="thongtinchitietgiave-title">
                                                    Thuế :
                                                </div>
                                                <div class="thongtinchitietgave-giave" ><span id="chuyendi__thue"></span>.000VND</div>
                                            </div>
                                            <div class="thongtinchitietgiave-item">
                                                <div class="thongtinchitietgiave-title">
                                                    Tổng :
                                                </div>
                                                <div class="thongtinchitietgave-giave" ><span id="chuyendi__tongtien"></span>.000VND</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <br>
                            <div class="chyenbayduocchon__chuyenbay chonchuyenve trangDienThongTinHanhKhach__muavemaybay" id="chuyenbayduocchon__chuyenve">
                                <div class="chyenbayduocchon__title"  >
                                    Chuyến Về
                                </div>
                                <div class="chyenbayduocchon__chitietchuyenbay">
                                    <div class="chyenbayduocchon__item">
                                        <div class="chyenbayduocchon__item__part">
                                            <span class="required" id="chuyenve__macb"> </span>
                                        </div>
                                        <div class="chyenbayduocchon__item__part chyenbayduocchon__item__part--text-align-right">
                                            <span class="chyenbayduocchon-thongtin" id="chuyenve__ngaybay"> </span>
                                            <br>
                                            <span class="chyenbayduocchon-thongtin" id="chuyenve__giobay"> </span>
                                            <br>
                                            <span class="chyenbayduocchon-thongtin" id="chuyenve__lichbay"> </span>
                                            <br>
                                            <span class="chyenbayduocchon-thongtin color-grey" id="chuyenve__hanhtrinhbay"> </span>
                                        </div>
                                    </div>
                                    <div class="chyenbayduocchon__item">
                                        <div class="chyenbayduocchon__item__part"></div>
                                        <div class="chyenbayduocchon__item__part">
                                            <div class="thongtinchitietgiave-item">
                                                <div class="thongtinchitietgiave-title">
                                                    Giá vé :
                                                </div>
                                                <div class="thongtinchitietgave-giave" ><span id="chuyenve__giave"></span>.000VND</div>
                                            </div>
                                            <div class="thongtinchitietgiave-item">
                                                <div class="thongtinchitietgiave-title">
                                                    Thuế :
                                                </div>
                                                <div class="thongtinchitietgave-giave" ><span id="chuyenve__thue"></span>.000VND</div>
                                            </div>
                                            <div class="thongtinchitietgiave-item">
                                                <div class="thongtinchitietgiave-title">
                                                    Tổng :
                                                </div>
                                                <div class="thongtinchitietgave-giave" ><span id="chuyenve__tongtien"></span>.000VND</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--/. kết thuc  box chuyen bay được chọn-->

                </div>
                <div class="row chonchuyendi">
                    <div class="thanhchuyentiep trangChonChuyenBay" id="thanhchuyentiep-chonchuyendi">
                        <div class="tongtienchuyenbay">
                            <span class="tongtien">Tổng Tiền:</span>
                            <span class="tongtien" id="thanhchuyentiep-chonchuyendi-tongtien">0</span><span>.000VND</span>
                        </div>
                        <button type="button" class="_btnChuyenTiep" id="btn__chuyentiep-chonchuyendi">Tiếp theo</button>
                    </div>
                </div>
                <div class="row chonchuyenve ">
                    <div class="thanhchuyentiep trangChonChuyenBay" id="thanhchuyentiep-chonchuyenve ">
                        <button type="button" class="_btnQuayLai" id="btn__quaylai-chonchuyenve">Quaylai</button>
                        <div class="tongtienchuyenbay">
                            <span class="tongtien">Tổng Tiền:</span>
                            <span class="tongtien" id="thanhchuyentiep-chonchuyenve-tongtien">0</span><span>.000VND</span>
                        </div>
                        <button type="button" class="_btnChuyenTiep" id="btn__chuyentiep-chonchuyenve">Tiếp theo</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- /. kết thuc trang chon chuyen-->

    <!--/. Kết thúc phần tìm chuyến và chọn chuyến-->
        <!--phần chân trang-->
        <jsp:include page="/footer.jsp"></jsp:include>
     	<!-- kết thúc chân trang -->
    </body>
</html>