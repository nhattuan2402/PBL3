$(document).ready(function(){
    $('ul.boxthongtinhachhang__dong-memu li').click(function(){

        // Xóa class 'select_box' khỏi tất cả các thẻ <li>
        $('ul.boxthongtinhachhang__dong-memu').find("li").removeClass('select');
        // Thêm class 'select_box' vào thẻ <li> được click
        $(this).addClass('select');

        var index = $(this).index();
        if (index === 0) { // Nếu là tab "All"
            $('.class__Vemaybay').removeClass('hidden');
        } else {
            $('.class__Vemaybay').addClass('hidden');
            $('.class__Vemaybay').eq(index-1).removeClass('hidden');
        }
    });
});


$(document).ready(function() {
    // Khi thẻ <li> được click
    $('ul.boxmenuTaiKhoanKhachHang li').click(function() {
        // Xóa class 'select_box' khỏi tất cả các thẻ <li>
        $('ul.boxmenuTaiKhoanKhachHang').find("li").removeClass('select__box');
        // Thêm class 'select_box' vào thẻ <li> được click
        $(this).addClass('select__box');

        var index = $(this).index();
        $('.container__thongtin').removeClass('hidden');
        $('.container__thongtin').addClass('hidden');
        $('.container__thongtin').eq(index).removeClass('hidden');
    });
});

$(document).ready(function(){
    $('.icondong').click(function(){
        $(this).closest('.vemaybay').next().toggleClass('hidden');
        $(this).toggleClass('hidden');
        $(this).siblings('.inconxo').toggleClass('hidden');
    });

    $('.inconxo').click(function(){
        $(this).closest('.vemaybay').next().toggleClass('hidden');
        $(this).toggleClass('hidden');
        $(this).siblings('.icondong').toggleClass('hidden');
    });
});
$(document).ready(function(){
    $('.class__btnSuaEmail').click(function(){

            $(".iconquaylai").removeClass('hidden');
            $(".iconquaylai").addClass('hidden');

            $('.class__suaemail').removeClass('hidden');
            $('.class__suaemail').addClass('hidden');
            $('.class__suaemail'). eq(0).removeClass('hidden');

    });
});
$(document).ready(function(){
    $('.btn_yeucau').click(function(){
        var index = $(this).data('index');
        if(index==0) {
            $(".iconquaylai").removeClass('hidden');
            $('.class__suaemail').removeClass('hidden');
            $('.class__suaemail').addClass('hidden');
            $('.class__suaemail').eq(index+1).removeClass('hidden');
        }
    });
});
$(document).ready(function(){
    $('.iconquaylai').click(function(){
        var index = $('.class__suaemail').filter(':not(.hidden)').index(); 
        $('.class__suaemail').removeClass('hidden');
        $('.class__suaemail').addClass('hidden');
        $('.class__suaemail').eq(index-2).removeClass('hidden');
    });
});
$(document).ready(function(){
    $('.item_input').on('input', function(e) {
        var $this = $(this);
        var val = $this.val();
        
        // Chỉ chấp nhận ký tự số
        if (!/^\d$/.test(val)) {
            $this.val('');
            return;
        }
        
        // Tự động chuyển đến thẻ input tiếp theo sau khi nhập
        var maxLength = parseInt($this.attr('maxlength'));
        if (val.length >= maxLength) {
            var nextInput = $this.parent().next('.thanhphan--maxacnhan').find('.item_input');
            if (nextInput.length) {
                nextInput.focus();
            }
        }
    });
});


function hamkiemtradauvaoMaXacThuc(input__so1,input__so2,input__so3,input__so4,input__so5,input__so6,class__nhom,idtheCanhBao,maxacnhan) {
    var class_box='.'+class__nhom;
    var check=true;
    var idthecanhbao ='#'+idtheCanhBao;
    var manguoidungnhap= document.getElementById(input__so1).value+document.getElementById(input__so2).value+document.getElementById(input__so3).value+
                        document.getElementById(input__so4).value+document.getElementById(input__so5).value+document.getElementById(input__so6).value;
    if (manguoidungnhap!=maxacnhan) {
        check= false;
        $(idthecanhbao).show()
        
    } else {
        $(idthecanhbao).hide()
        $(class_box).removeClass('hidden');
        $(class_box).addClass('hidden');
        $(class_box).eq(2).removeClass('hidden');

    }
    return check;
}
function hamkiemtraInPutEmailthaydoi(emailMoiKhachHang) {
    var check=true;
    if (!required(emailMoiKhachHang)) 
        {
            check= false
        } else if (!kiemtraEmailHopLe(emailMoiKhachHang)){
            check = false;
        }
    return check;
}
$(document).ready(function(){
    $('.iconquaylai-sdt').click(function(){
        var index = $('.class__suasdt').filter(':not(.hidden)').index(); 
        $('.class__suasdt').removeClass('hidden');
        $('.class__suasdt').addClass('hidden');
        $('.class__suasdt').eq(index-2).removeClass('hidden');
    });
});
$(document).ready(function(){
    $('.class__btnSuaSoDienThoai').click(function(){

            $(".iconquaylai-sdt").removeClass('hidden');
            $(".iconquaylai-sdt").addClass('hidden');

            $('.class__suasdt').removeClass('hidden');
            $('.class__suasdt').addClass('hidden');
            $('.class__suasdt'). eq(0).removeClass('hidden');

    });
});
$(document).ready(function(){
    $('.btn_yeucau-sdt').click(function(){
        var index = $(this).data('index');
        if(index==0) {
            $(".iconquaylai-sdt").removeClass('hidden'); 
            $('.class__suasdt').removeClass('hidden');
            $('.class__suasdt').addClass('hidden');
            $('.class__suasdt').eq(index+1).removeClass('hidden');
        }
    });
});
function hamkiemtraInPutSoDienThoaithaydoi(sodienthoaikhachhang) {
    var check=true;
    if (!required(sodienthoaikhachhang)){
        check= false
    } else if (!kiemTraTatCaLaSo(sodienthoaikhachhang)){
        check = false;
    } 
    return check;
}





$(document).ready(function(){
    $('.iconquaylai-password').click(function(){
        var index = $('.class__suapassword').filter(':not(.hidden)').index(); 
        $('.class__suapassword').removeClass('hidden');
        $('.class__suapassword').addClass('hidden');
        $('.class__suapassword').eq(index-2).removeClass('hidden');
    });
});
$(document).ready(function(){
    $('.class__btnSuaPassword').click(function(){

            $(".iconquaylai-password").removeClass('hidden');
            $(".iconquaylai-password").addClass('hidden');

            $('.class__suapassword').removeClass('hidden');
            $('.class__suapassword').addClass('hidden');
            $('.class__suapassword'). eq(0).removeClass('hidden');

    });
});
$(document).ready(function(){
    $('.btn_yeucau-password').click(function(){
        var index = $(this).data('index');
        if(index==0) {
            $(".iconquaylai-password").removeClass('hidden'); 
            $('.class__suapassword').removeClass('hidden');
            $('.class__suapassword').addClass('hidden');
            $('.class__suapassword').eq(index+1).removeClass('hidden');
        }
    });
});
function kiemtradauvaopassword(newpasswordkhachhang) {
    var check=true;
    if (!required(newpasswordkhachhang)){
        check= false
    }
    return check;
}
$(document).ready(function() {
    // Xử lý khi người dùng click vào phần giới tính
    $('[data-click="gender"]').click(function() {
        var $inputWrap = $(this).find('.input-wrap');
        var $autoListWrapper = $(this).find('.auto-list-wrapper');
        var $icondong = $(this).find('.icondong');
        var $inconxo = $(this).find('.inconxo');

        // Kiểm tra trạng thái hiện tại của phần auto-list-wrapper
        if ($autoListWrapper.hasClass('hidden')) {
            // Nếu đang ẩn, hiển thị lên
            $autoListWrapper.removeClass('hidden');
            $icondong.addClass('hidden');
            $inconxo.removeClass('hidden');
        } else {
            // Nếu đang hiển thị, ẩn đi
            $autoListWrapper.addClass('hidden');
            $icondong.removeClass('hidden');
            $inconxo.addClass('hidden');
        }
    });

    // Xử lý khi người dùng chọn một mục trong danh sách giới tính
    $('[data-click="gender"] .auto-list-wrapper li').click(function() {
        // Loại bỏ class 'choosed' từ tất cả các mục và ẩn biểu tượng 'fa-check'
        $('[data-click="gender"] .auto-list-wrapper li').removeClass('choosed');
        $('[data-click="gender"] .auto-list-wrapper li i.fa-check').addClass('hidden');

        // Thêm class 'choosed' vào mục được chọn và hiển thị biểu tượng 'fa-check'
        $(this).addClass('choosed');
        $(this).find('i.fa-check').removeClass('hidden');

        // Cập nhật giá trị của input
        var selectedGender = $(this).text().trim();
        $(this).closest('.input-wrap').find('input').val(selectedGender);
    });
});

$(document).ready(function() {
    // Xử lý khi một thẻ input nhận focus
    $('input').focus(function() {
        // Loại bỏ class "blue-label" khỏi tất cả các nhãn (label)
        $('.name-input label').removeClass('blue-label');
        // Loại bỏ class "input-active" khỏi tất cả các div "input-wrap"
        $('.name-input .input-wrap').removeClass('input-active');
        
        // Thêm class "blue-label" vào nhãn (label) của thẻ input được focus
        $(this).closest('.name-input').find('label').addClass('blue-label');
        // Thêm class "input-active" vào div "input-wrap" của thẻ input được focus
        $(this).closest('.input-wrap').addClass('input-active');
    });
});




document.addEventListener("DOMContentLoaded", function() {
    // Lấy ra nút "Chỉnh sửa"
    var editButton = document.getElementById("chinhsuathongtinkhachhang");
    // Lấy ra modal fade
    var modal = document.getElementById("suathongtinkhachhang");

    // Khi click vào nút "Chỉnh sửa"
    editButton.addEventListener("click", function() {
        // Lấy ra các phần tử cần chỉnh sửa trong box thông tin cá nhân
        var name = document.getElementById("TenKhachHang").textContent;
        var dob = document.getElementById("NgaySInhKhachHang").textContent;
        var address = document.getElementById("DiaChiKhachHang").textContent;
        var gender = document.getElementById("GioiTinhKhachHang").textContent;

        // Chuyển định dạng ngày sinh sang yyyy-mm-dd
        var dobParts = dob.split('/');
        var formattedDob = dobParts[2] + '-' + dobParts[1] + '-' + dobParts[0];

        // Đẩy dữ liệu vào modal fade nếu trường không rỗng
        if (name.trim() !== "") {
            document.getElementById("inputNameKhachhang").value = name;
        }
        if (dob.trim() !== "") {
            document.getElementById("inputNgaySinhKhachhang").value = formattedDob;
        }
        if (address.trim() !== "") {
            document.getElementById("inputDiaChiKhachhang").value = address;
        }
        if (gender.trim() !== "") {
            document.getElementById("inputGioiTinhKhachhang").value = gender;
        }
    });

    // Lấy ra nút "Lưu Thay Đổi"
    var saveButton = document.querySelector(".btnLuThayDoithongtin");

    // Khi click vào nút "Lưu Thay Đổi"
    saveButton.addEventListener("click", function() {
        // Lấy ra dữ liệu từ modal fade
        var newName = document.getElementById("inputNameKhachhang").value;
        var newDob = document.getElementById("inputNgaySinhKhachhang").value;
        var newAddress = document.getElementById("inputDiaChiKhachhang").value;
        var newGender = document.getElementById("inputGioiTinhKhachhang").value;

        // Kiểm tra trường rỗng trước khi cập nhật
        if (newName.trim() !== "") {
            document.getElementById("TenKhachHang").textContent = newName;
        }
        if (newDob.trim() !== "") {
            // Chuyển định dạng ngày sinh từ yyyy-mm-dd sang dd/mm/yyyy
            var newDobParts = newDob.split('-');
            var formattedNewDob = newDobParts[2] + '/' + newDobParts[1] + '/' + newDobParts[0];
            document.getElementById("NgaySInhKhachHang").textContent = formattedNewDob;
        }
        if (newAddress.trim() !== "") {
            document.getElementById("DiaChiKhachHang").textContent = newAddress;
        }
        if (newGender.trim() !== "") {
            document.getElementById("GioiTinhKhachHang").textContent = newGender;
        }

        // Đóng modal fade
        $('#suathongtinkhachhang').modal('hide');
    });
});
