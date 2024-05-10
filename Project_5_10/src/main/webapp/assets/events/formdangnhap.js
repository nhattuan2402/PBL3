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

    if (!kiemtraEmailHopLe(idEmail))  check = false;

    if (!required(idEmail)) check= false

    if (!required(idPassword)) check= false
    
    return check;
}