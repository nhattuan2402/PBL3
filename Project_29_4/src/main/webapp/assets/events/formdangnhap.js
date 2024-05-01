  // form dang nhap
  $(document).ready( function(){
    
    $(".navbar__formdangnhap__icon-exit, ._dangky").click(function extFormSignIn() {
        $(".navbar__dangNhap").hide();
        $("#memberEmailSignIn").val("");
        $("#memberPasswordSignIn").val("")
    })
})
// kết thúc sự kiện  form CSKH
$(document).ready( function(){
    // Xử lý sự kiện khi người dùng nhấp chuột bên ngoài phần tử
   $(document).on("click", function(e) {
    var $target = $(e.target);
    if($target.is($(".dangnhap"))) {
        $(".navbar__dangNhap").fadeIn("1000")
    }
    else
    // Kiểm tra xem người dùng đã nhấp chuột bên ngoài phần tử hay không
    if (!$target.is($(".navbar__dangNhap")) && !$target.closest($(".navbar__dangNhap")).length && $(".navbar__dangNhap").is(":visible")) {
        $(".navbar__dangNhap").hide(); // Ẩn phần tử
    }
});
})

//kiểm tra input dang nhap

function kiemtraInputDangNhap(idEmail,idPassword)
{   
    var check=true;
    var giaTriEmail = document.getElementById(idEmail).value;
    var thePEmail = document.getElementById(idEmail).nextElementSibling;
    var giaTriPassword = document.getElementById(idPassword).value;
    var thePPassword = document.getElementById(idPassword).nextElementSibling;

    if (!kiemtraEmailHopLe(idEmail))  check = false;

    if (giaTriEmail != ""){
        thePEmail.style.display = "none";
    } else {
        thePEmail.style.display = "block";
        thePEmail.innerHTML = "*Email không được để trống"
        check=false
    }
    if (giaTriPassword != ""){
        thePPassword.style.display = "none";
    } else {
        thePPassword.style.display = "block";
        thePPassword.innerHTML = "*Password không được để trống"
        check = false;
    }
    return check;
}