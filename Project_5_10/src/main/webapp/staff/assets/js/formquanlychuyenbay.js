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