// xử lý sự kiện focus vao list chuyen bay- chon chuyen di
$(document).ready( function(){
    $(".chuyenbaydi").on("click", function() {

        var ngayBay=$('#ngaydi__thongtinhanhtrinh').text();
        $("#chuyendi__ngaybay").text(ngayBay);

        var maCB=$(this).find('#flight-option__maCB').text();
        $("#chuyendi__macb").text(maCB);
        $("#maCBDi").val(maCB);

        var thoiGianBay=$(this).find('#flight-option__thoigianbay').text();
        $("#chuyendi__giobay").text(thoiGianBay);

        var lichBay=$(this).find('#flight-option__thoigiandi-den').text();
        $("#chuyendi__lichbay").text(lichBay);

        var HanhTrinhbay= $('#diemdi__thongtinhanhtrinh').text() +" Đến "+$('#diemden__thongtinhanhtrinh').text()
        $("#chuyendi__hanhtrinhbay").text(HanhTrinhbay);

        var giaVe=$(this).find('#flight-option__gia').text();
        $("#chuyendi__giave").text(giaVe);

        var thue=giaVe*0.1
        $("#chuyendi__thue").text(thue);

        var tongTien= parseFloat(thue)+parseFloat(giaVe);
        $("#chuyendi__tongtien").text(tongTien);

        $("#thanhchuyentiep-chonchuyendi-tongtien").text(tongTien);
    })
})

// xử lý sự kiện focus vao list chuyen bay- chon chuyen ve
$(document).ready( function(){
    $(".chuyenbayve").on("click", function() {

        var ngayBay=$('#ngayve__thongtinhanhtrinh').text();
        $("#chuyenve__ngaybay").text(ngayBay);

        var maCB=$(this).find('#flight-option__maCB').text();
        $("#chuyenve__macb").text(maCB);
        $("#maCBVe").val(maCB);

        var thoiGianBay=$(this).find('#flight-option__thoigianbay').text();
        $("#chuyenve__giobay").text(thoiGianBay);

        var lichBay=$(this).find('#flight-option__thoigiandi-den').text();
        $("#chuyenve__lichbay").text(lichBay);

        var HanhTrinhbay= $('#diemden__thongtinhanhtrinh').text() +" Đến "+$('#diemdi__thongtinhanhtrinh').text()
        $("#chuyenve__hanhtrinhbay").text(HanhTrinhbay);

        var giaVe=$(this).find('#flight-option__gia').text();
        $("#chuyenve__giave").text(giaVe);

        var thue=giaVe*0.1
        $("#chuyenve__thue").text(thue);

        var tongTien= parseFloat(thue)+parseFloat(giaVe);
        $("#chuyenve__tongtien").text(tongTien);
        
        var tongTienChuyenKhuHoi = parseFloat($("#chuyendi__tongtien").text()) + parseFloat($("#chuyenve__tongtien").text()) ;

        $("#thanhchuyentiep-chonchuyenve-tongtien").text(tongTienChuyenKhuHoi);
        
        $("#btn__chuyentiep-chonchuyenve").prop("disabled", false);
    })
})

// thanh chuyen tiep chon chuyen di 
$(document).ready( function(){
    $("#btn__chuyentiep-chonchuyendi").click(function hoantatconchuyendi() {
        if ($("#chuyendi__macb").text()!="" && $('#loaichuyenbay__thongtinhanhtrinh').text ()=="Chuyến bay Khứ hồi" ){
            $(".chonchuyendi").hide();
            $(".chonchuyenve").show();
        }
    })
})

$(document).ready(function() {
	$("#btn__chuyentiep-chonchuyendi-1chieu").click(function hoantatconchuyendi() {
		if ($("#chuyendi__macb").text() != "") {
			return true;
		} else {
			return false;
		}
	})
})
		

// thanh chuyen tiep cchon chuyen ve btn quay lai
$(document).ready( function(){
    $("#btn__quaylai-chonchuyenve, .timkiemchuyenbay__phantu--btnTimChuyenBay").click(function hoantatconchuyendi() {
            $(".chonchuyendi").show();
            $(".chonchuyenve").hide();
    })
})

// thanh chuyen tiep chon chuyen ve
$(document).ready(function() {
	$("#btn__chuyentiep-chonchuyenve").click(function hoantatconchuyendi() {
		if ($("#chuyenve__macb").text() != "") {
			return true;
		} 
	})
})
