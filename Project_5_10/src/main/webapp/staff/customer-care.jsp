<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
String url = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ request.getContextPath();
NhanVien nhanVien = (NhanVien)session.getAttribute("nhanVien");

if (nhanVien != null) {
	request.setAttribute("nhanvien", nhanVien);
} else {
    response.sendRedirect(url + "/index.jsp");
}

ArrayList<HoTro> allHoTro = (ArrayList<HoTro>) session.getAttribute("allHoTro");

if (allHoTro == null ){
	response.sendRedirect(url + "/index.jsp");
}

%>
<style>
.flight-item:last-child {
	border-bottom: 1px solid #ccc;
}

.form-container {
	display: flex;
	flex-direction: row;
	align-items: center;
	margin-top: 20px; /* Ajust the top margin as needed */
}

.form-container textarea {
	width: 100%;
	height: 150px;
	margin-bottom: 10px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	resize: none;
	margin-right: 10px;
}

.form-container .response-button {
	display: flex;
	justify-content: center;
	align-items: center;
}

.form-container button {
	padding: 10px 20px;
	background-color: #007bff;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.form-container button:hover {
	background-color: #0056b3;
}

.response-text {
	width: 100%;
	height: 150px;
	margin-bottom: 10px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
	resize: none;
	margin-right: 10px;
	margin-top: 10px;
}

.none-border {
	border: none;
}
</style>
<title>Chăm sóc khách hàng</title>
<jsp:include page="includes-staff/header-staff.jsp"></jsp:include>
</head>
<body>
	<jsp:include page="includes-staff/navbar-staff.jsp"></jsp:include>
	<div class="container quanlychuyenbay">
	                <!-- Modal Chi tiết yêu cầu khách hàng -->
             <div class="modal fade" id="xoachuyenbay" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <form action="#" method="post">
                    <div class="themchuyenbay">
                        <div class="themchuyenbay-title">
                            Thông Tin Chi Tiết Yêu Cầu Khách Hàng
                        </div>
                        <div class="vungchua__themchuyenbay">
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="MaCBXoa">Mã CSKH</label></div>
                                    <input type="text" id="MaCBXoa" class="macbXoa" readonly>
                                </div>
                                <div class="themchuyenbay__dong">
                                    <div class="themchuyenbay__phantu">
                                        <div class="label"><label for="ngaybaychuyenbaychinhsua">Email Khách Hàng</label></div>
                                        <div class="noidungthechitietCSKH">ndtrg281@gmail.com</div>
                                    </div>
                                    <div class="themchuyenbay__phantu">
                                        <div class="label"><label for="giobaychuyenbaychinhsua">Thời Gian Yêu Cầu</label></div>
                                        <div class="noidungthechitietCSKH">2024-05-17</div>
                                    </div>
                                </div>
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="giobaychuyenbaychinhsua">Mô Tả Yêu Cầu</label></div>
                                    <div class="noidungthechitietCSKH">Quá trời quá đất hahahaha hôm nay trời nắng không mưa đồ đồ </div>
                                </div>
                                <div class="themchuyenbay__phantu">
                                    <div class="label"><label for="giobaychuyenbaychinhsua motachitietyeucau">Mô Tả Chi Tiết</label></div>
                                    <div class="noidungthechitietCSKH">
                                        Thơ là hình thức nghệ thuật dùng từ trong ngôn ngữ làm chất liệu và sự chọn lọc từ cũng như tổ hợp của chúng được sắp xếp dưới hình thức
                                         logic nhất định tạo nên hình ảnh hay gợi cảm âm thanh có tính thẩm mĩ cho người đọc, người nghe. Từ thơ thường được đi kèm với từ câu để chỉ
                                          một câu thơ, hay với từ bài để chỉ một bài thơ. Một câu thơ là một hình thức câu cô đọng, truyền đạt một hoặc nhiều hình ảnh, có ý nghĩa cho người đọc, 
                                          và hoàn chỉnh trong cấu trúc ngữ pháp. Một câu thơ có thể đứng nguyên một mình. Một bài thơ là tổ hợp của các câu thơ. Tính cô đọng trong số lượng từ, 
                                          tính tượng hình và dư âm thanh nhạc trong thơ biến nó thành một hình thức nghệ thuật độc đáo, tách biệt hẳn khỏi các hình thức nghệ thuật khác.
                                     </div>
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
            <!--/. kết thúc Modal chi tiết yêu cầu khách hang -->
	<!-- Modal xóa chuyến bay -->
          <div class="modal fade" id="phanhoi-CSKH" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
             <div class="modal-dialog modal-dialog-centered" role="document">
                 <form action="<%=url%>/nhan-vien-controller?hanhDong=phan-hoi-hotro" method="post">
                  <div class="themchuyenbay">
                      <div class="themchuyenbay-title" style="color: red;">
                         	Nhập thông tin phản hôi!
                      </div>
                      <div class="vungchua__themchuyenbay">
                              <div class="themchuyenbay__phantu">
                                  <div class="label"><label for="MaCBXoa">ID Yêu cầu:</label></div>
                                  <input name="idHoTro" type="text" id="MaCBXoa" class="macbXoa" readonly>
                                  <textarea class="response-text" name="responseMessage" id="response" placeholder="Nhập phản hồi"></textarea>
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
       <!-- thanh tiêu đề-->
       <div class="row">
           <div class="col-xs-12  col-md-12 mt-10" style="margin-top: 40px;">
               <div class="quanlychuyenbay--title   " >
                   <span >Chăm sóc khách hàng</span>
               </div>
           </div>
       </div>
         <!-- /. kết thúc thanh tiêu đề-->
			
       <div class="vungchua1">
           <!-- thanh tìm kiếm chuyến bay-->
           <form action="<%= url%>/nhan-vien-controller" class="timkiemchuyenbay timkiemchuyenbay--quanlychuyen">
           	<input type="hidden" name="hanhDong" value="tim-kiem-cskh">
               <div class="timkiemchuyenbay__phantu" >
                   <input type="text" name="input_email-cskh" class="input__machyen" placeholder="Email?" id="timkiemchuyenMa">
               </div>

               <div class="timkiemchuyenbay__phantu" >
                   <input type="date" name="input_time-cskh" id="timkiemchuyendate">
               </div>
		        <select class="timkiemchuyenbay__phantu" name="trangThai-cskh" id="statusFilter" style="height: 100%; width: 100%; padding-bottom:1rem; ">
		            <option value="">Tất cả</option>
		            <option value="DaXuLy">Đã xử lý</option>
		            <option value="ChuaXuLy">Chưa xử lý</option>
		        </select>
                
                <button type="submit" class="timkiemchuyenbay__phantu timkiemchuyenbay__phantu--btnTimChuyenBay" >Tìm kiếm</button>
           </form>
           <!-- /. kết thúc thanh tìm kiếm chuyến bay-->
       </div>


       <div class="row box-flight-list">
           <!-- box danh sách chuyến bay đi và bay về-->
           <div class="flight-list col-xs-12  col-md-12 ">
               <div class="box-flight-list" >
                   <div class="flight-list-header box-quanlychuyenbay ">
                       <div class="flight-list-header__item ">ID</div>
                       <div class="flight-list-header__item ">Email</div>
                       <div class="flight-list-header__item">Thời gian nhận</div>
                       <div class="flight-list-header__item">Trạng thái</div>
                       <div class="flight-list-header__item">Thông tin chi tiết</div>
                       <div class="flight-list-header__item">Phản hồi</div>
                   </div>
                   <div class="flight-lists  box-quanlychuyenbay ">
                  <%
           		if (allHoTro == null) {
           			response.sendRedirect(url + "/index.jsp");
           		}
           		for (HoTro h : allHoTro) {
           			String status = h.isTrangThai() ? "Đã xử lý" : "Chưa xử lý";
                   %>
                   	<div class="flight-item  quanlychuyen-item">
                         <div class=" quanlychuyen-option" >
							<div class="quanlychuyen-option-item mscb"><%= h.getMaHoTro() %></div>
                             	<div class="quanlychuyen-option-item "><%= h.getEmail() %></div>
                             	<div class="quanlychuyen-option-item"><%= h.getThoiGian() %></div>
                             	<div class="quanlychuyen-option-item"><%= status %></div>
                             	<div class="quanlychuyen-option-item quanlychuyen-option-item-tacvu">
                                    <button type="button" class="btnTacVu btn__xoachuyen none-border" data-toggle="modal" data-target="#xoachuyenbay">
                                        <i class="fa-solid fa-info"></i>
                                    </button>
                                </div>
                             	<div class="quanlychuyen-option-item quanlychuyen-option-item-tacvu">
	                             	<button type="button" class="btnTacVu none-border" data-toggle="modal" data-target="#phanhoi-CSKH" >
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
	
	<jsp:include page="includes-staff/footer-staff.jsp"></jsp:include>
</body>
<script>
document.addEventListener("DOMContentLoaded", function() {
    var btnTacVuList = document.querySelectorAll('.btnTacVu');
    btnTacVuList.forEach(function(btnTacVu) {
        btnTacVu.addEventListener('click', function() {
            // Lấy mã hỗ trợ từ phần tử HTML tương ứng
            var maHoTro = this.closest('.quanlychuyen 	-option').querySelector('.mscb').innerText;
            // Đặt mã hỗ trợ vào input trong modal
            //document.getElementById('MaCBXoa-2').value = maHoTro;
            document.querySelectorAll('.macbXoa').forEach(function(input) {
					input.value = maHoTro;
				});
				//('MaCBXoa').value = maHoTro;

			});
		});
	});

	document.addEventListener("DOMContentLoaded", function() {
		var selectBox = document.getElementById('statusFilter');
		var flightItems = document.querySelectorAll('.flight-item');

		selectBox.addEventListener('change', function() {
			var selectedValue = this.value;

			flightItems.forEach(function(item) {
				var status = item.querySelector('.status').innerText;

				if (selectedValue === '' || status === selectedValue) {
					item.style.display = 'block';
				} else {
					item.style.display = 'none';
				}
			});
		});
	});
</script>
</html>