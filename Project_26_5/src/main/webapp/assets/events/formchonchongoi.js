
var soHK;
var loaicb;

$(document).ready(function(){
	
var ghedaduocmua = {};
	$.ajax({
    url: "ghedaduocchon",
    type: "GET",
    dataType: "json",
    success: function(data) {
       ghedaduocmua = data;
       console.log(ghedaduocmua)
    }, 
}),
	
$.ajax({
    url: "dien-thong-tin",
    type: "GET",
    dataType: "json",
    success: function(data) {
        // Lấy dữ liệu từ phản hồi và lưu vào sessionStorage
        sessionStorage.setItem("loaiVe", data.loaiVe);
        sessionStorage.setItem("soHK", data.soHK);
        
        // Sau khi nhận được dữ liệu, gán vào các biến
        loaicb = sessionStorage.getItem("loaiVe");
        soHK = sessionStorage.getItem("soHK");
    },
    error: function(error) {
        console.error("Lỗi khi gửi yêu cầu đến servlet:", error);
    }
}),

	
    $(".ghethuonggiachuyendi, .ghethuonggiachuyenve,.ghephothongchuyenve,.ghephothongchuyendi").click( function chonChoNgoi() {
        
        if (!$(this).hasClass('gheBiChon')) {
            $(this).addClass("gheBiChon");
            var idThe= $(this).attr('id');
            var idchuyendiHK;
            var idchuyenveHK;
            for (var i=1 ;i<=soHK;i++) {
                idchuyendiHK='#chuyendiHK'+i;
                idchuyenveHK='#chuyenveHK'+i;
                if (!$(idchuyendiHK).hasClass('hidden')) 
                {
                    $('#MaSoGhechuyendiHK'+i).text(idThe);
                    var idghehuychon= $('#maSoGhe--chuyendiHK'+i).val();
                    if (idghehuychon!="") {
                        $('#'+idghehuychon).removeClass('gheBiChon');
                    }
                    $('#maSoGhe--chuyendiHK'+i).val(idThe);
                    break;
                } else
                if (!$(idchuyenveHK).hasClass('hidden'))  {
                    $('#MaSoGhechuyenveHK'+i).text(idThe);
                    var idghehuychon= $('#maSoGhe--chuyenveHK'+i).val();
                    if (idghehuychon!="") {
                        $('#'+idghehuychon).removeClass('gheBiChon');
                    }
                    $('#maSoGhe--chuyenveHK'+i).val(idThe);
                    break;
                }
            }
        }
    })
})

var index=1;
function chuyenTiepChonChoNgoi() {
    var check = true;
    for (var i = 1; i <= soHK; i++) {
        if (($('#maSoGhe--chuyenveHK' + i).val() == "") && loaicb == 'Khứ hồi') {
            check = false;
        }
        if (($('#maSoGhe--chuyendiHK' + i).val() == "")) {
            check = false;
        }
    }
    for (var i = 1; i <= soHK; i++) {
        var j = i + 1;
        var idchuyendiHK = 'chuyendiHK' + i;
        var idchuyenveHK = 'chuyenveHK' + i;
        if (!document.getElementById(idchuyenveHK).classList.contains('hidden') &&  loaicb == 'Khứ hồi' && i != soHK) {
            document.getElementById(idchuyenveHK).classList.add('hidden');
            document.getElementById('chuyendiHK' + j).classList.remove('hidden');
            document.getElementById('chuyenbaydi--tieude').classList.add('chuyenbaydangchon');
            document.getElementById('chuyenbayve--tieude').classList.remove('chuyenbaydangchon');
            document.getElementById('maybay__chuyenve').classList.add('hidden');
            document.getElementById('maybay__chuyendi').classList.remove('hidden');
            index=i+1;
            break;
        } else if (!document.getElementById(idchuyendiHK).classList.contains('hidden') && loaicb == 'Khứ hồi') {
            document.getElementById(idchuyendiHK).classList.add('hidden');
            document.getElementById(idchuyenveHK).classList.remove('hidden');
            document.getElementById('chuyenbaydi--tieude').classList.remove('chuyenbaydangchon');
            document.getElementById('chuyenbayve--tieude').classList.add('chuyenbaydangchon');
            document.getElementById('maybay__chuyenve').classList.remove('hidden');
            document.getElementById('maybay__chuyendi').classList.add('hidden');
            index=i;
            break;
        } else if (!document.getElementById(idchuyendiHK).classList.contains('hidden') && loaicb == 'Một chiều' && i != soHK) {
            document.getElementById('chuyendiHK' + j).classList.remove('hidden');
            document.getElementById(idchuyendiHK).classList.add('hidden');
            index=i+1;
            break;
        }
    }
    if (index != soHK) {
        check = false;
    }

    return check;
}


function quayLaiChonChoNgoi() {

    for (var i=1 ;i<=soHK;i++) {
        var idchuyendiHK='#chuyendiHK'+i;
        var idchuyenveHK='#chuyenveHK'+i;
        if (!$(idchuyendiHK).hasClass('hidden') && loaicb=='Khứ hồi' && (i!=1)) {
            $(idchuyendiHK).addClass('hidden');
            var j=i-1;
            $('#chuyenveHK'+j).removeClass('hidden');
            $('#chuyenbayve--tieude').addClass('chuyenbaydangchon');
            $('#chuyenbaydi--tieude').removeClass('chuyenbaydangchon');
            document.getElementById('maybay__chuyenve').classList.remove('hidden');
            document.getElementById('maybay__chuyendi').classList.add('hidden');
            index=i-1;
            break;
        }else

        if (!$(idchuyenveHK).hasClass('hidden') && loaicb=='Khứ hồi') {
            $(idchuyendiHK).removeClass('hidden');
            $(idchuyenveHK).addClass('hidden');
            $('#chuyenbaydi--tieude').addClass('chuyenbaydangchon');
            $('#chuyenbayve--tieude').removeClass('chuyenbaydangchon');
            document.getElementById('maybay__chuyendi').classList.remove('hidden');
            document.getElementById('maybay__chuyenve').classList.add('hidden');
            index=i;
            break;
        } else
        if (!$(idchuyendiHK).hasClass('hidden') && loaicb=='Một chiều' && (i!=1)) {
            var j=i-1;
            $('#chuyendiHK'+i).addClass('hidden');
            $('#chuyendiHK'+j).removeClass('hidden');
            index=i-1;
            break;
        }
    }
   
    return true;
}


function taoMaTranChoNgoichuyendiA32X(sogheThuongGia, soCotThuongGia, soghePhoThong1, soghePhoThong2,soghePhoThong3, soCotPhoThong) {
var html = '';

// Tạo phần thương gia
var Chimuc = 'A'
var sohang = 1
html += '<div class=" maTranViTriChoNgoi__thuonggia">';
html += '<div class="maTranViTriChoNgoi__dong">';
for (let index = 0; index < soCotThuongGia+1; index++) {
    if (index!=soCotThuongGia/2) {
        html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc">'+Chimuc+'</div>';
        Chimuc=  String.fromCharCode(Chimuc.charCodeAt(0) +1) 
    }
    else
        html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
}
html += '</div>';

for (var i = 0; i < sogheThuongGia/soCotThuongGia; i++) {
    html += '<div class="maTranViTriChoNgoi__dong">';
    for (var j = 0; j < soCotThuongGia+1; j++) {
        if ((((i==parseInt(sogheThuongGia/soCotThuongGia)) &&(j==0||j==soCotThuongGia))||(i==0 && (j==parseInt(soCotThuongGia/2)+1)))&&(parseInt(soCotThuongGia)%soCotThuongGia)==3) {
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
            console.log("1")
        } else if (((i==0 && (j==parseInt(soCotThuongGia/2)+1)))&&(parseInt(soCotThuongGia)%soCotThuongGia)==5) 
        {
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
        } else if (((i==parseInt(soCotThuongGia/soCotThuongGia)) &&(j==0||j==soCotThuongGia))&&(parseInt(soCotThuongGia)%soCotThuongGia)==4) {
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
        } else if (j!=parseInt(soCotThuongGia/2))
            html += '<div class="maTranViTriChoNgoi__dong__phantu ghethuonggiachuyendi" id="TG1' + ''+(i + 1) +'' + (j + 1) + '"></div>';
        else
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc">'+sohang++ +'</div>';
    }
    html += '</div>';
}
html += '</div>';



// Tạo phần phổ thông

Chimuc='A'
html += '<div class=" maTranViTriChoNgoi__phothong">';
    html+= '<div class="cuaRaVao">';
        html+='<div class="cuaRaVao__phantu"><i class="fa-solid fa-circle-exclamation"></i> Cửa thoát hiểm</div> ';
        html+='<div class="cuaRaVao__phantu"> Cửa thoát hiểm <i class="fa-solid fa-circle-exclamation"></i></div> ';
    html+='</div>'
html += '<div class="maTranViTriChoNgoi__dong">';
for (let index = 0; index < soCotPhoThong+1; index++) {
    if (index!=soCotPhoThong/2){
        html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc">'+Chimuc +'</div>';
        Chimuc=  String.fromCharCode(Chimuc.charCodeAt(0) +1)  
    }
    else
        html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
}
html += '</div>';

console.log(parseInt(soghePhoThong1/soCotPhoThong))
//phan 1 ghe pho thong
for (var i = 0; i < parseInt(soghePhoThong1/soCotPhoThong)+1; i++) {
    html += '<div class="maTranViTriChoNgoi__dong">';
    for (var j = 0; j < soCotPhoThong+1; j++) {
        if ((((i==parseInt(soghePhoThong1/soCotPhoThong)) &&(j==0||j==soCotPhoThong))||(i==0 && (j==parseInt(soCotPhoThong/2)+1)))&&(parseInt(soghePhoThong1)%soCotPhoThong)==3) {
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
            console.log("1")
        } else if (((i==0 && (j==parseInt(soCotPhoThong/2)+1)))&&(parseInt(soghePhoThong1)%soCotPhoThong)==5) 
        {
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
        } else if (((i==parseInt(soghePhoThong1/soCotPhoThong)) &&(j==0||j==soCotPhoThong))&&(parseInt(soghePhoThong1)%soCotPhoThong)==4) {
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
        } else if (j!=parseInt(soCotPhoThong/2))
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phantu--phothong ghephothongchuyendi" id="PT1' + ''+(i + 1) +'' + (j + 1) + '"></div>';
        else
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc">'+sohang++ +'</div>';
    }
    html += '</div>';
}

html+= '<div class="cuaRaVao">';
    html+='<div class="cuaRaVao__phantu"><i class="fa-solid fa-circle-exclamation"></i> Cửa thoát hiểm</div> ';
    html+='<div class="cuaRaVao__phantu"> Cửa thoát hiểm <i class="fa-solid fa-circle-exclamation"></i></div> ';
html+='</div>'

//phan 2 ghe pho thong
for (var i = 0; i < parseInt(soghePhoThong2/soCotPhoThong)+1; i++) {
    html += '<div class="maTranViTriChoNgoi__dong">';
    for (var j = 0; j < soCotPhoThong+1; j++) {
        if ((((i==parseInt(soghePhoThong2/soCotPhoThong)) &&(j==0||j==soCotPhoThong))||(i==0 && (j==parseInt(soCotPhoThong/2)+1)))&&(parseInt(soghePhoThong2)%soCotPhoThong)==3) {
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
            console.log("1")
        } else if (((i==0 && (j==parseInt(soCotPhoThong/2)+1)))&&(parseInt(soghePhoThong2)%soCotPhoThong)==5) 
        {
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
        } else if (((i==parseInt(soghePhoThong2/soCotPhoThong)) &&(j==0||j==soCotPhoThong))&&(parseInt(soghePhoThong2)%soCotPhoThong)==4) {
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
        } else if (j!=parseInt(soCotPhoThong/2))
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phantu--phothong  ghephothongchuyendi" id="PT2' + ''+(i + 1) +'' + (j + 1) + '"></div>';
        else
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc">'+sohang++ +'</div>';
    }
    html += '</div>';
}

html+= '<div class="cuaRaVao">';
    html+='<div class="cuaRaVao__phantu"><i class="fa-solid fa-circle-exclamation"></i> Cửa thoát hiểm</div> ';
    html+='<div class="cuaRaVao__phantu"> Cửa thoát hiểm <i class="fa-solid fa-circle-exclamation"></i></div> ';
html+='</div>'

//phan 3 ghe pho thong
for (var i = 0; i < parseInt(soghePhoThong3/soCotPhoThong)+1; i++) {
    html += '<div class="maTranViTriChoNgoi__dong">';
    for (var j = 0; j < soCotPhoThong+1; j++) {
        if ((((i==parseInt(soghePhoThong3/soCotPhoThong)) &&(j==0||j==soCotPhoThong))||(i==0 && (j==parseInt(soCotPhoThong/2)+1)))&&(parseInt(soghePhoThong3)%soCotPhoThong)==3) {
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
            console.log("1")
        } else if (((i==0 && (j==parseInt(soCotPhoThong/2)+1)))&&(parseInt(soghePhoThong3)%soCotPhoThong)==5) 
        {
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
        } else if (((i==parseInt(soghePhoThong3/soCotPhoThong)) &&(j==0||j==soCotPhoThong))&&(parseInt(soghePhoThong3)%soCotPhoThong)==4) {
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
        } else if (j!=parseInt(soCotPhoThong/2))
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phantu--phothong  ghephothongchuyendi" id="PT3' + ''+(i + 1) +'' + (j + 1) + '"></div>';
        else
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc">'+sohang++ +'</div>';
    }
    html += '</div>';
}
html += '</div>';

document.getElementById('maTranViTriChoNgoicd').innerHTML = html;
return html;
}


// chuyen ve
function taoMaTranChoNgoichuyenveA32X(sogheThuongGia, soCotThuongGia, soghePhoThong1, soghePhoThong2,soghePhoThong3, soCotPhoThong) {
    var html = '';
    
    // Tạo phần thương gia
    var Chimuc = 'A'
    var sohang = 1
    html += '<div class=" maTranViTriChoNgoi__thuonggia">';
    html += '<div class="maTranViTriChoNgoi__dong">';
    for (let index = 0; index < soCotThuongGia+1; index++) {
        if (index!=soCotThuongGia/2) {
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc">'+Chimuc+'</div>';
            Chimuc=  String.fromCharCode(Chimuc.charCodeAt(0) +1) 
        }
        else
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
    }
    html += '</div>';
    
    for (var i = 0; i < sogheThuongGia/soCotThuongGia; i++) {
        html += '<div class="maTranViTriChoNgoi__dong">';
        for (var j = 0; j < soCotThuongGia+1; j++) {

            if ((((i==parseInt(sogheThuongGia/soCotThuongGia)) &&(j==0||j==soCotThuongGia))||(i==0 && (j==parseInt(soCotThuongGia/2)+1)))&&(parseInt(soCotThuongGia)%soCotThuongGia)==3) {
                html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
                console.log("1")
            } else if (((i==0 && (j==parseInt(soCotThuongGia/2)+1)))&&(parseInt(soCotThuongGia)%soCotThuongGia)==5) 
            {
                html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
            } else if (((i==parseInt(soCotThuongGia/soCotThuongGia)) &&(j==0||j==soCotThuongGia))&&(parseInt(soCotThuongGia)%soCotThuongGia)==4) {
                html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
            } else if (j!=parseInt(soCotThuongGia/2))
                html += '<div class="maTranViTriChoNgoi__dong__phantu   ghethuonggiachuyenve" id="TG11' + ''+(i + 1) +'' + (j + 1) + '"></div>';
            else
                html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc">'+sohang++ +'</div>';
        }
        html += '</div>';
    }
    html += '</div>';
    
    
    
    // Tạo phần phổ thông
    
    Chimuc='A'
    html += '<div class=" maTranViTriChoNgoi__phothong">';
        html+= '<div class="cuaRaVao">';
            html+='<div class="cuaRaVao__phantu"><i class="fa-solid fa-circle-exclamation"></i> Cửa thoát hiểm</div> ';
            html+='<div class="cuaRaVao__phantu"> Cửa thoát hiểm <i class="fa-solid fa-circle-exclamation"></i></div> ';
        html+='</div>'
    html += '<div class="maTranViTriChoNgoi__dong">';
    for (let index = 0; index < soCotPhoThong+1; index++) {
        if (index!=soCotPhoThong/2){
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc">'+Chimuc +'</div>';
            Chimuc=  String.fromCharCode(Chimuc.charCodeAt(0) +1)  
        }
        else
            html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
    }
    html += '</div>';
    
    console.log(parseInt(soghePhoThong1/soCotPhoThong))
    //phan 1 ghe pho thong
    for (var i = 0; i < parseInt(soghePhoThong1/soCotPhoThong)+1; i++) {
        html += '<div class="maTranViTriChoNgoi__dong">';
        for (var j = 0; j < soCotPhoThong+1; j++) {
            if ((((i==parseInt(soghePhoThong1/soCotPhoThong)) &&(j==0||j==soCotPhoThong))||(i==0 && (j==parseInt(soCotPhoThong/2)+1)))&&(parseInt(soghePhoThong1)%soCotPhoThong)==3) {
                html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
                console.log("1")
            } else if (((i==0 && (j==parseInt(soCotPhoThong/2)+1)))&&(parseInt(soghePhoThong1)%soCotPhoThong)==5) 
            {
                html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
            } else if (((i==parseInt(soghePhoThong1/soCotPhoThong)) &&(j==0||j==soCotPhoThong))&&(parseInt(soghePhoThong1)%soCotPhoThong)==4) {
                html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
            } else if (j!=parseInt(soCotPhoThong/2))
                html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phantu--phothong  ghephothongchuyenve" id="PT11' + ''+(i + 1) +'' + (j + 1) + '"></div>';
            else
                html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc">'+sohang++ +'</div>';
        }
        html += '</div>';
    }
    
    html+= '<div class="cuaRaVao">';
        html+='<div class="cuaRaVao__phantu"><i class="fa-solid fa-circle-exclamation"></i> Cửa thoát hiểm</div> ';
        html+='<div class="cuaRaVao__phantu"> Cửa thoát hiểm <i class="fa-solid fa-circle-exclamation"></i></div> ';
    html+='</div>'
    
    //phan 2 ghe pho thong
    for (var i = 0; i < parseInt(soghePhoThong2/soCotPhoThong)+1; i++) {
        html += '<div class="maTranViTriChoNgoi__dong">';
        for (var j = 0; j < soCotPhoThong+1; j++) {
            if ((((i==parseInt(soghePhoThong2/soCotPhoThong)) &&(j==0||j==soCotPhoThong))||(i==0 && (j==parseInt(soCotPhoThong/2)+1)))&&(parseInt(soghePhoThong2)%soCotPhoThong)==3) {
                html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
                console.log("1")
            } else if (((i==0 && (j==parseInt(soCotPhoThong/2)+1)))&&(parseInt(soghePhoThong2)%soCotPhoThong)==5) 
            {
                html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
            } else if (((i==parseInt(soghePhoThong2/soCotPhoThong)) &&(j==0||j==soCotPhoThong))&&(parseInt(soghePhoThong2)%soCotPhoThong)==4) {
                html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
            } else if (j!=parseInt(soCotPhoThong/2))
                html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phantu--phothong  ghephothongchuyenve" id="PT22' + ''+(i + 1) +'' + (j + 1) + '"></div>';
            else
                html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc">'+sohang++ +'</div>';
        }
        html += '</div>';
    }
    
    html+= '<div class="cuaRaVao">';
        html+='<div class="cuaRaVao__phantu"><i class="fa-solid fa-circle-exclamation"></i> Cửa thoát hiểm</div> ';
        html+='<div class="cuaRaVao__phantu"> Cửa thoát hiểm <i class="fa-solid fa-circle-exclamation"></i></div> ';
    html+='</div>'
    
    //phan 3 ghe pho thong
    for (var i = 0; i < parseInt(soghePhoThong3/soCotPhoThong)+1; i++) {
        html += '<div class="maTranViTriChoNgoi__dong">';
        for (var j = 0; j < soCotPhoThong+1; j++) {
            if ((((i==parseInt(soghePhoThong3/soCotPhoThong)) &&(j==0||j==soCotPhoThong))||(i==0 && (j==parseInt(soCotPhoThong/2)+1)))&&(parseInt(soghePhoThong3)%soCotPhoThong)==3) {
                html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
                console.log("1")
            } else if (((i==0 && (j==parseInt(soCotPhoThong/2)+1)))&&(parseInt(soghePhoThong3)%soCotPhoThong)==5) 
            {
                html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
            } else if (((i==parseInt(soghePhoThong3/soCotPhoThong)) &&(j==0||j==soCotPhoThong))&&(parseInt(soghePhoThong3)%soCotPhoThong)==4) {
                html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc"></div>';
            } else if (j!=parseInt(soCotPhoThong/2))
                html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phantu--phothong  ghephothongchuyenve" id="PT33' + ''+(i + 1) +'' + (j + 1) + '"></div>';
            else
                html += '<div class="maTranViTriChoNgoi__dong__phantu maTranViTriChoNgoi__dong__phant--chimuc">'+sohang++ +'</div>';
        }
        html += '</div>';
    }
    html += '</div>';
    
    document.getElementById('maTranViTriChoNgoicv').innerHTML = html;
    return html;
    }
    
