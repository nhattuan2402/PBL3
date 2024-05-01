
// header phần notification    
$(document).ready( function (){
    $(".thongbao__exit").click(function tatThongBao() {
        $(".thongBao").hide("1000");
    })
})
// hết phần notification 

// sự kiện varbar
$(document).ready( function(){
    $(".muaVeVaSanPham").click(function quaylaitrangchu() {
        location.reload();
    })
});

// sự kiện thanh tìm kiếm chuyến bay

$(document).ready( function(){

    /**
     * code chon lich bay 
     */

    const calendar_departure_date = flatpickr("#departure-date", {
        enableTime: false,
        dateFormat: "Y-m-d",
        minDate: "today",
        onChange: function(selectedDates) {
            // Khi ngày khởi hành thay đổi, cập nhật minDate cho calendar_return_date
            if (selectedDates.length > 0) {
                const departureDate = selectedDates[0];
                calendar_return_date.set("minDate", departureDate.fp_incr(1)); // Thêm 1 ngày
            }
        }
    });
    const calendar_return_date = flatpickr("#return-date", {
        enableTime: false,
        dateFormat: "Y-m-d",
        minDate: new Date().fp_incr(1) // Mặc định là ngày mai
    });
    
    $("#round-trip").click(function checked_trip(){ 
        $(".timkiemchuyenbay__chonlich__ngayve").show("1000");
    })
    $("#one-way").click(function checked_trip(){ 
        $(".timkiemchuyenbay__chonlich__ngayve").hide("1000");
    })

    $(".chonlich__btnXacnhan").click(function hienThiLenThanhTimKiem() {
        var lichBay="";
        if ($("#round-trip").is(':checked')==true && $("#departure-date").val()!="" && $("#return-date").val()!="") {
            lichBay=$("#departure-date").val()+" to " +$("#return-date").val();
            $(".btn_lichBay").val(lichBay)
        } else 
        if ($("#one-way").is(':checked')==true && $("#departure-date").val()!="") {
            lichBay=$("#departure-date").val();
            $(".btn_lichBay").val(lichBay)
        }
        $(".timkiemchuyenbay_phantu__chonlich").hide("1000");
    })
})


$(document).ready( function(){
    // Xử lý sự kiện khi người dùng nhấp chuột bên ngoài phần tử
   $(document).on("click", function(e) {
    var $target = $(e.target);
    if($target.is($(".HienthiSoHK"))) {
        $(".demSoKhachHang").show("1000")
    }
    else
    // Kiểm tra xem người dùng đã nhấp chuột bên ngoài phần tử hay không
    if (!$target.is($(".demSoKhachHang")) && !$target.closest($(".demSoKhachHang")).length && $(".demSoKhachHang").is(":visible")) {
        $(".demSoKhachHang").hide(); // Ẩn phần tử
    }else
    if($target.is($(".btn_lichBay"))) {
        $(".timkiemchuyenbay_phantu__chonlich").show("1000")
    } else if (!$target.is($(".timkiemchuyenbay_phantu__chonlich")) && !$target.closest($(".timkiemchuyenbay_phantu__chonlich")).length && $(".timkiemchuyenbay_phantu__chonlich").is(":visible")) {
        $(".timkiemchuyenbay_phantu__chonlich").hide(); // Ẩn phần tử
    }
});
    $(".timchuyenbay__demsohanhkhach__exit").click(function demSoHK() {
            $(".demSoKhachHang").hide()
    })
    $(".btCountNL, .btCountTE").click(function btCount() {
        var text_bt = $(this).text();
        var count;
        if (text_bt=="-") {
            count = parseInt($(this).next().text()); 
            if (count > 0) {
                count--; 
            }
            $(this).next().text(count); 
        }else 
        {
            count = parseInt($(this).prev().text());
            count++;
            $(this).prev().text(count);  
        }
        var txt_btDemSoKH="",
            count_NL = parseInt($(".numberNL").text()),
            count_TE = parseInt($(".numberTE").text())

        if (count_NL!=0 && count_TE!=0) {
            txt_btDemSoKH+=count_NL+" Người lớn "+count_TE+" Trẻ em";
        } else if ((count_NL+count_TE)==0) {
            count_NL++;
            txt_btDemSoKH+=count_NL+" Người lớn ";
            $(".numberNL").text(count_NL);
            alert("Cần chọn tối thiểu một hành khách để tìm kiếm vé phù hợp!")
        } else if (count_NL==0)
            txt_btDemSoKH+=count_TE+" Trẻ em";
        else   
            txt_btDemSoKH+=count_NL+" Người lớn ";
            $(".HienthiSoHK").val(txt_btDemSoKH);
    })
})

     var vietnamCities = [
        "Hà Nội",
        "Hồ Chí Minh",
        "Đà Nẵng",
        "Hải Phòng",
    ];


    /**
     *  code sử lý xự kiện thẻ input thành phố đi - sự kiện forcus - sự kiện nhập liệu và cho recommend theo dữ liẹu thành phố
     */

    $(document).ready(function() {

        $(".text_demkhoihanh").on("focus", function() {
            var inputText = $(this).val().toLowerCase();
            var suggestions = [];
    
            // Lọc các thành phố phù hợp với ký tự nhập vào
            vietnamCities.forEach(function(city) {
                if (city.toLowerCase().startsWith(inputText)&& city!=$(".text_demden").val()) {
                    suggestions.push(city);
                }
            });
    
            // Hiển thị gợi ý trong danh sách ul
            var $citySuggestions = $(".timkiemchuyenbay_thanhphodi");
            $citySuggestions.empty();
            suggestions.forEach(function(suggestion) {
                $citySuggestions.append("<li class=\"timkiemchuyenbay__phantu-list-item diemkhoihanh\">" + suggestion + "</li>");
            });
        });

        // Xử lý sự kiện khi người dùng nhập ký tự
        $(".text_demkhoihanh").on("input", function() {
            var inputText = $(this).val().toLowerCase();
            var suggestions = [];
    
            // Lọc các thành phố phù hợp với ký tự nhập vào
            vietnamCities.forEach(function(city) {
                if (city.toLowerCase().startsWith(inputText)&& city!=$(".text_demden").val()) {
                    suggestions.push(city);
                }
            });
    
            // Hiển thị gợi ý trong danh sách ul
            var $citySuggestions = $(".timkiemchuyenbay_thanhphodi");
            $citySuggestions.empty();
            suggestions.forEach(function(suggestion) {
                $citySuggestions.append("<li class=\"timkiemchuyenbay__phantu-list-item diemkhoihanh\">" + suggestion + "</li>");
            });
        });

        $(".timkiemchuyenbay_thanhphodi").on("mousedown", ".diemkhoihanh", function() {
            var nameTP = $(this).text();
            $(".text_demkhoihanh").val(nameTP);
        }); $(".timkiemchuyenbay_thanhphodi").on("mousedown", ".diemkhoihanh", function() {
            var nameTP = $(this).text();
            $(".text_demkhoihanh").val(nameTP);
        });
    });


    /**
     *  code sử lý xự kiện thẻ input thành phố Đen - sự kiện forcus - sự kiện nhập liệu và cho recommend theo dữ liẹu thành phố
     */
    $(document).ready(function() {

        $(".text_demden").on("focus", function() {
            var inputText = $(this).val().toLowerCase();
            var suggestions = [];
    
            // Lọc các thành phố phù hợp với ký tự nhập vào
            vietnamCities.forEach(function(city) {
                if (city.toLowerCase().startsWith(inputText)&& city!=$(".text_demkhoihanh").val()) {
                    suggestions.push(city);
                }
            });
    
            // Hiển thị gợi ý trong danh sách ul
            var $citySuggestions = $(".timkiemchuyenbay_thanhphoden");
            $citySuggestions.empty();
            suggestions.forEach(function(suggestion) {
                $citySuggestions.append("<li class=\"timkiemchuyenbay__phantu-list-item Diemden\">" + suggestion + "</li>");
            });
        });
        // Xử lý sự kiện khi người dùng nhập ký tự
        $(".text_demden").on("input", function() {
            var inputText = $(this).val().toLowerCase();
            var suggestions = [];
    
            // Lọc các thành phố phù hợp với ký tự nhập vào
            vietnamCities.forEach(function(city) {
                if (city.toLowerCase().startsWith(inputText) && city!=$(".text_demkhoihanh").val()) {
                    suggestions.push(city);
                }
            });
    
            // Hiển thị gợi ý trong danh sách ul
            var $citySuggestions = $(".timkiemchuyenbay_thanhphoden");
            $citySuggestions.empty();
            suggestions.forEach(function(suggestion) {
                $citySuggestions.append("<li class=\"timkiemchuyenbay__phantu-list-item Diemden\">" + suggestion + "</li>");
            });
        });
        $(".timkiemchuyenbay_thanhphoden").on("mousedown", ".Diemden", function() {
            var nameTP = $(this).text();
            $(".text_demden").val(nameTP);
        });

        // su kien chuyen tu trang chu sang trang chon chuyen bay
        $(".timkiemchuyenbay__phantu--btnTimChuyenBay").click( function timchuyenbay() {
           $( '.trangchonchuyenbay').show();
            $('.trangchonchuyenbay').css ({
                'margin': '0rem auto',
                'margin-top': '2rem',
                'margin-bottom': '5rem',
                'color':' var(--text-greyer-color)'
            })
            $(".trangchu__timkiemchuyenbay").css({
                "margin-top": "5rem",
                "background-color": "var(--white-color)",
                "background-image": "none",
                "padding": "0"
            });
            $('.trangchu__slogan').css({
                'display': 'none'
            });
        });

    });
// kết thuc phan tim chuyen bay




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
