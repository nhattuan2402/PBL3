var giaHanhLy = 100;
var tongtien =0 ;
var giachuyendi=0 ;
var giachuyenve=0;

$(document).ready( function(){
    var tongtien = $('#thanhchuyentiep-DienThongTin-tongtien').text();
    $('#tong_tien').val(tongtien);
})

$(document).ready( function(){
	giachuyendi = parseFloat($('#chuyendi__tongtien').text());
	var giachuyenveText = $('#chuyenve__tongtien').text(); // Lấy văn bản từ phần tử với ID là 'chuyenve__tongtien'
	giachuyenve = giachuyenveText != "" ? parseFloat(giachuyenveText) : 0;
	console.log(giachuyenve);
	tongtien = giachuyendi + giachuyenve;
	$('#thanhchuyentiep-DienThongTin-tongtien').text(tongtien);
})

$(document).ready( function(){
    $('.btn__GiamKhoiLuongKyGui').click( function GiamKLKyGui() {
        var theKLHangKyGui=$(this).next();
        var KhoiLuongHangKyGui = parseInt(theKLHangKyGui.text());
        if (KhoiLuongHangKyGui>=5) {
            KhoiLuongHangKyGui-=5;
            tongtien -=giaHanhLy;
            $('#thanhchuyentiep-DienThongTin-tongtien').text(tongtien);
        	$('#tong_tien').val(tongtien);
        }
        theKLHangKyGui.text(KhoiLuongHangKyGui);
        $(this).siblings('.KhoiLuongKyGui').val(KhoiLuongHangKyGui);
    })
})

$(document).ready( function(){
    $('.btn__TangKhoiLuongKyGui').click( function GiamKLKyGui() {
        var theKLHangKyGui=$(this).prev();
        var KhoiLuongHangKyGui = parseInt(theKLHangKyGui.text());
        KhoiLuongHangKyGui+=5;
        tongtien += giaHanhLy;
        $('#thanhchuyentiep-DienThongTin-tongtien').text(tongtien);
        theKLHangKyGui.text(KhoiLuongHangKyGui);
        $(this).siblings('.KhoiLuongKyGui').val(KhoiLuongHangKyGui);
        $('#tong_tien').val(tongtien);
    })
})



$(document).ready( function(){
    $('.hovaten__nhapthongtinHK').blur( function GiamKLKyGui() {
        var idtagname = $(this).prop('id');
        var idtagnameKhoiLuongHk =idtagname.replace('hovaten','tenHK');
        var tenHK= $(this).val();
        document.getElementById(idtagnameKhoiLuongHk).innerHTML= tenHK
    })
})



function submitDienThongTinHk(sohanhKhachNL,sohanhKhachTE) {
    
    var check= true;
    for (let index = 1; index <= sohanhKhachNL; index++) {
        
        let idtagname='hovaten__nhapthongtinHKNL'+index;
        if (!required(idtagname))
        {
            check= false
        } else if (!allLetter(idtagname)){ 
            check = false;
        }

        let idtagNgaySinh='ngaySinh__nhapthongtinHKNL'+index;
        if (!required(idtagNgaySinh))
        {
            check= false
        }

        let idtagEmail='email__nhapthongtinHKNL'+index;
        if (!required(idtagEmail)) 
        {
            check= false
        } else if (!kiemtraEmailHopLe(idtagEmail)){
            check = false;
        }

        let idtagSDT='SDT__nhapthongtinHKNL'+index;
        if (!required(idtagSDT)){
            check= false
        } else if (!kiemTraTatCaLaSo(idtagSDT)){
            check = false;
        }

        let idtagDiaCHi='DiaChi__nhapthongtinHKNL'+index;
        if (!required(idtagDiaCHi))
        {
            check= false
        } else if (!allLetter(idtagDiaCHi)){ 
            check = false;
        }

        let idtagQuocTich='QuocTich__nhapthongtinHKNL'+index;
        if (!required(idtagQuocTich))
        {
            check= false
        } else if (!allLetter(idtagQuocTich)){ 
            check = false;
        }

        let idtagGioiTinh='GioiTinh__nhapthongtinHKNL'+index;
        if (!required(idtagGioiTinh))
        {
            check= false
        } else if (!SEX(idtagGioiTinh)){ 
            check = false;
        }

        let idtagCCCD='CCCD__nhapthongtinHKNL'+index;
        if (!required(idtagCCCD)){
            check= false
        } else if (!kiemTraTatCaLaSo(idtagCCCD)){
            check = false;
        } 
    }
    for (let index = 1; index <= sohanhKhachTE; index++) {
        
        let idtagname='hovaten__nhapthongtinHKTE'+index;
        if (!required(idtagname))
        {
            check= false
        } else if (!allLetter(idtagname)){ 
            check = false;
        }

        let idtagNgaySinh='ngaySinh__nhapthongtinHKTE'+index;
        if (!required(idtagNgaySinh))
        {
            check= false
        }

        let idtagDiaCHi='DiaChi__nhapthongtinHKTE'+index;
        if (!required(idtagDiaCHi))
        {
            check= false
        } else if (!allLetter(idtagDiaCHi)){ 
            check = false;
        }

        let idtagQuocTich='QuocTich__nhapthongtinHKTE'+index;
        if (!required(idtagQuocTich))
        {
            check= false
        } else if (!allLetter(idtagQuocTich)){ 
            check = false;
        }

        let idtagGioiTinh='GioiTinh__nhapthongtinHKTE'+index;
        if (!required(idtagGioiTinh))
        {
            check= false
        } else if (!SEX(idtagGioiTinh)){ 
            check = false;
        }
    }
    return check;
}