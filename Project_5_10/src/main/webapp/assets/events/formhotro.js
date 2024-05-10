//  xử lý xử kiện form CSKH
$(document).ready( function(){
    $(".navbar__formcskh__icon-exit").click(function formErrollClose() {
        $(".cskh").hide();
    });
})    
$(document).ready( function(){
    // Xử lý sự kiện khi người dùng nhấp chuột bên ngoài phần tử
   $(document).on("click", function(e) {
    var $target = $(e.target);
    if($target.is($(".hoTro"))) {
        $(".cskh").fadeIn("1000")
    }
    else
    // Kiểm tra xem người dùng đã nhấp chuột bên ngoài phần tử hay không
    if (!$target.is($(".cskh")) && !$target.closest($(".cskh")).length && $(".cskh").is(":visible")) {
        $(".cskh").hide(); // Ẩn phần tử
    }
});
})
// kết thúc sự kiện  form CSKH
function kiemtraInputPhieuHoTro(VanDe__CSKH,Email__CSKH,MaVe__CSKH,ChiTietYeuCau__CSKH) {
    
    var check = true

    if (!required(VanDe__CSKH))
    {
         check= false
    } else if (!allLetter(VanDe__CSKH)){ 
        check = false
    }

    if (!required(MaVe__CSKH))  check= false
   
    if (!required(ChiTietYeuCau__CSKH)) check= false

    if (!required(Email__CSKH)) 
    {
        check= false
    } else if (!kiemtraEmailHopLe(Email__CSKH)){
        check = false;
    }


    return check 

}