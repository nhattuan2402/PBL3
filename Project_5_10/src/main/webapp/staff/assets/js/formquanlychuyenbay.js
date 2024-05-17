function kiemtradauvaoThemChuyenBay(giaChuyen,ngaybaychuyenbay) {

    var check=true;

    if (!required(ngaybaychuyenbay))
    {
         check= false
    }
    if (!required(giaChuyen)){
        check= false
    } else if (!kiemTraTatCaLaSo(giaChuyen)){
        check = false;
    } 

    return check
}
function hamkiemtratimkiemchuyen(timkiemchuyenMa,timkiemchuyendate) {
    var check = true;
    if (document.getElementById('timkiemchuyenMa').value == "" && document.getElementById('timkiemchuyendate').value == "") {
        check = false;
        alert(" Bạn Vui Lòng Nhập Thông Tin Trước Khi Tìm Kiếm Chuyến Bay")
    }    
    return check;
}

$(document).ready(function() {

    $(".btn__suathongtinchuyen").on("mousedown", function() {
        var theMSCB= $(this).parent().siblings(".mscb").text();
        $("#MaCBChinhSua").val(theMSCB);
    });
})

$(document).ready(function() {

    $(".btn__xoachuyen").on("mousedown", function() {
        var theMSCB= $(this).parent().siblings(".mscb").text();
        $("#MaCBXoa").val(theMSCB);
    });
})

function kiemTraGiaChuyen(giaChuyenDi, giaChuyenDen, giaChuyenThoiGian) {
	var check = true;
	if (!required(giaChuyenDi) || !required(giaChuyenDen) || !required(giaChuyenThoiGian)) {
		check = false;
		 alert(" Bạn Vui Lòng Nhập Thông Tin Trước Khi Thêm Tuyến Bay")
	} 
	return check;
}