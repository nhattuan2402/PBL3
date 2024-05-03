
// header phần notification    
$(document).ready( function (){
    $(".thongbao__exit").click(function tatThongBao() {
        $(".thongBao").hide("1000");
    })
})
// hết phần notification 


// sự kiện messagebox
$(document).ready( function(){
    // Xử lý sự kiện khi người dùng nhấp chuột bên ngoài phần tử
   $(document).on("click", function(e) {
        var $target = $(e.target);
        var txt_thongbao =$("#messagebox_warning-content").text();
        txt_thongbao=txt_thongbao.trim();
        if($target.is($(".timkiemchuyenbay__phantu--btnTimChuyenBay"))&&(txt_thongbao!="")) {
            $("#messagebox_warning").fadeIn("1000")
        } else
        // Kiểm tra xem người dùng đã nhấp chuột bên ngoài phần tử hay không
        if (!$target.is($(".messagebox")) && !$target.closest($(".messagebox")).length && $(".messagebox").is(":visible")) {
            $("#messagebox_warning").hide(); // Ẩn phần tử
            $("#messagebox_warning-content").text("");
        }
    });
})





// kiểm tra tính đúng đắn của input


// Email
function kiemtraEmailHopLe(idtag) {
    var inputTag = document.getElementById(idtag);
    var emailPattern = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;
    var theP = inputTag.nextElementSibling;

    if (inputTag.value.match(emailPattern)) {
        theP.style.display = "none";
        return true;
    } else {
        theP.style.display = "block";
        theP.innerHTML = "*Email bạn nhập không hợp lệ"
        return false;
    }
}
// là chuỗi ký tự
function allLetter(idtag) {
    var inputTag = document.getElementById(idtag);
    var letter = /^[A-Za-z]+$/;
    var theP = inputTag.nextElementSibling;
    if (inputTag.value.match(letter)) {
        theP.style.display = "none";
        return true;
    } else {
        theP.style.display = "block";
        theP.innerHTML = "*Chỉ nhập ký tự (A-Z,a-z)";
        return false;
    }
}



// Tất cả là số
function kiemTraTatCaLaSo(idtag) {
    var inputTag = document.getElementById(idtag);
    var letter =/^[0-9]+$/;
    var theP = inputTag.nextElementSibling;
    if (inputTag.value.match(letter)){
        theP.style.display = "none";
        return true;
    } else {
        theP.style.display = "block";
        theP.innerHTML = "*Chỉ nhập ký tự (0-9)"
        return false;
    }
}

// ngày tháng năm hợp lệ
function isValidDate(dateString) {
    const dateRegex = /^\d{4}-\d{2}-\d{2}$/;
    if (!dateRegex.test(dateString)) {
        return false;
    }

    const dateParts = dateString.split("-");
    const year = parseInt(dateParts[0], 10);
    const month = parseInt(dateParts[1], 10);
    const day = parseInt(dateParts[2], 10);
    const dateObject = new Date(year, month - 1, day);

    // Kiểm tra năm nhuận
    if (month === 2 && day === 29) {
        if ((year % 4 === 0 && year % 100 !== 0) || year % 400 === 0) {
            return true; // Năm nhuận
        } else {
            return false; // Năm không nhuận
        }
    }

    return (
        dateObject.getFullYear() === year &&
        dateObject.getMonth() === month - 1 &&
        dateObject.getDate() === day
    );
}

// yêu cầu nhập

function required(idtag) {
    var inputTag = document.getElementById(idtag);
    var theP = inputTag.nextElementSibling;
    if (inputTag.value!=""){
        theP.style.display = "none";
        return true;
    } else {
        theP.style.display = "block";
        theP.innerHTML = "*Không được để trống"
        return false;
    }
}
