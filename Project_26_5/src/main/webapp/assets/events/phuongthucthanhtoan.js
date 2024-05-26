const discountCodes = {
    'CODE20': { discount: 20, quantity: 5 },
    'CODE30': { discount: 30, quantity: 3 },
    'CODE50': { discount: 50, quantity: 1 }
  };

$(document).ready(function() {
    $(".btnSubmit__magiamgia").click(function() {
      
        var discountCode = ($(".input__mathanhtoan").val().trim()).toUpperCase();
        if (discountCodes.hasOwnProperty(discountCode)) {
            var tongtientamtinh =parseInt($('.tongtientamtinh1').text()) ;
            var totalPrice = calculateTotal(tongtientamtinh, discountCode); 
            var tongkhuyenmai =tongtientamtinh-totalPrice ;
            $('.tongtienmakhuyenmai').text(tongkhuyenmai);
            $('.tongtiencanthanhtoan').text(totalPrice);
        } else {
            alert('Mã giảm giá không hợp lệ hoặc đã hết.');
        }
        $('#tienthanhtoan').val(totalPrice);
        $('#tienkhuyenmai').val(tongkhuyenmai);
    });
});
  
  // Hàm tính tổng tiền sau khi giảm giá
  function calculateTotal(price, code) {
    if (discountCodes[code] && discountCodes[code].quantity > 0) {
      const discount = discountCodes[code].discount / 100;
      return price - (price * discount);
    } else {
      alert('Mã giảm giá không hợp lệ hoặc đã hết.');
      return price;
    }
  }
$(document).ready(function() {
    // Khi thẻ <li> được click
    $('ul.phuongthucthanhtoan li').click(function() {
        // Xóa class 'select_box' khỏi tất cả các thẻ <li>
        $('ul.phuongthucthanhtoan').find("li").removeClass('select__phuongthuc');
        // Thêm class 'select_box' vào thẻ <li> được click
        $(this).addClass('select__phuongthuc');
        var _value = $(this).val();
        $('#input_phuongthuc').val(_value);
    });
});

$(document).ready(function(){
  $('#sudungmaquatang').change(function(){
    if($(this).is(':checked')){
      $('#magiamgia').show();
    } else {
      $('#magiamgia').hide();
    }
  });
})