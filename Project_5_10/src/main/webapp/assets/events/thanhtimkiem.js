
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
    

    $(".timchuyenbay__demsohanhkhach__exit").click(function demSoHK() {
            $(".demSoKhachHang").hide()
    })
    $(".btCountNL, .btCountTE").click(function btCount() {
		console.log("click btCount" +  $(this).text());	
        var text_bt = $(this).text();
        console.log(text_bt);
        var count;
        if (text_bt=="-") {
            count = parseInt($(this).next().text()); 
            if (count > 0) {
                count = count - 1;
            }
            console.log("- st. " + count);
            $(this).next().text(count); 
        }else 
        {
            count = parseInt($(this).prev().text());
            count = count + 1;
            console.log("+ st. " + count);
            $(this).prev().text(count);  
        }
        var txt_btDemSoKH="",
            count_NL = parseInt($(".numberNL").text()),
            count_TE = parseInt($(".numberTE").text())

        if (count_NL!=0 && count_TE!=0) {
            txt_btDemSoKH+=count_NL+" Người lớn "+count_TE+" Trẻ em";
            $("#soHanhKach_nguoilon").val(count_NL);
            $("#soHanhKach_treem").val(count_TE);
        } else if ((count_NL+count_TE)==0) {
            count_NL++;
            txt_btDemSoKH+=count_NL+" Người lớn ";
            $(".numberNL").text(count_NL);
            $("#soHanhKach_nguoilon").val(1);
            $("#soHanhKach_treem").val(0);
            alert("Cần chọn tối thiểu một hành khách để tìm kiếm vé phù hợp!")
        } else if (count_NL==0)
        {
            txt_btDemSoKH+=count_TE+" Trẻ em";
            $("#soHanhKach_treem").val(count_TE);
        }
        else
        {
            txt_btDemSoKH+=count_NL+" Người lớn ";
            $("#soHanhKach_nguoilon").val(count_NL);
            $("#soHanhKach_treem").val(0);
        }   
            $(".HienthiSoHK").val(txt_btDemSoKH);
    })
})



$(document).ready( function(){

     var vietnamCities;
    	$.ajax({
        url: "laythanhpho",
        type: "GET",
        dataType: "json",
        success: function(data) {
           vietnamCities = data;
           console.log(vietnamCities); 
        }, 
    })


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

        // sự kiện chọn thành phố
        $(".timkiemchuyenbay_thanhphodi").on("mousedown", ".diemkhoihanh", function() {
            var nameTP = $(this).text();
            $(".text_demkhoihanh").val(nameTP);
            $("#diemKhoiHanh").val(nameTP);

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
            $("#diemden").val(nameTP);
        });

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
    } 
    })



 });

    $("#radio_round-trip").click(function checked_trip(){ 
        $(".timkiemchuyenbay__chonlich__ngayve").show("1000");
    })
    $("#radio_one-way").click(function checked_trip(){ 
        $(".timkiemchuyenbay__chonlich__ngayve").hide("1000");
    })

    $(".chonlich__btnXacnhan").click(function hienThiLenThanhTimKiem() {
        var lichBay="";
        if ($("#radio_round-trip").is(':checked')==true && $("#departure-date").val()!="" && $("#return-date").val()!="") {
            lichBay=$("#departure-date").val()+" - " +$("#return-date").val();
            $(".btn_lichBay").val(lichBay)
        }
        if ($("#radio_one-way").is(':checked')==true && $("#departure-date").val()!="") {
            lichBay=$("#departure-date").val();
            $(".btn_lichBay").val(lichBay)
        }
        $(".timkiemchuyenbay_phantu__chonlich").hide("1000");
    })
})

function timkiemchuyenbay(diemKhoiHanh,diemden,departure_date,return_date,radio_round_trip,soHanhKach_nguoilon,soHanhKach_treem,diemKhoiHanh_ThanhTimKiem,diemDen_ThanhTimKiem) {
    
    var txt_thongbao ="";
    var check = true;
    var the__diemKhoiHanh= document.getElementById(diemKhoiHanh); 
    var the__diemKhoiHanh_thanhtimkiem= document.getElementById(diemKhoiHanh_ThanhTimKiem); 
    if (the__diemKhoiHanh.value == "" || the__diemKhoiHanh_thanhtimkiem.value == ""){
        txt_thongbao+="Điểm khởi hành không được để trống<br>"
        check = false
    }

    var the__diemden= document.getElementById(diemden); 
    var the__diemDen_ThanhTimKiem= document.getElementById(diemDen_ThanhTimKiem); 
    if (the__diemden.value == ""|| the__diemDen_ThanhTimKiem.value == "" ){
        txt_thongbao+="Điểm Đến không được để trống<br>"
        check = false
    }

    var the__radio_round_trip= document.getElementById(radio_round_trip); 
    var the__departure_date= document.getElementById(departure_date); 
    var the__return_date= document.getElementById(return_date); 
    var the__thanhtimkiem= document.getElementById('lichBay_ThanhTimKiem'); 
    
    var loaichuyenbay="";

    if (the__radio_round_trip.checked) {
        loaichuyenbay="Chuyến bay Khứ hồi"
        if (the__departure_date.value=="" || the__return_date.value =="") {
            txt_thongbao+="Lịch bay không được để trống<br>"
            check = false
        }

    } else
    {
        loaichuyenbay="Chuyến bay một chiều"
        if (the__departure_date.value=="") {
            txt_thongbao+="Lịch bay không được để trống<br>"
            check = false
        }
    }

    var the__noidungthongbao= document.getElementById("messagebox_warning-content");
    if (the__noidungthongbao.value=="") {
        txt_thongbao+="Lịch bay không được để trống<br>"
        check = false
    }



    if (!check) {
        the__noidungthongbao.innerHTML=txt_thongbao;
    }  else {

        
        document.getElementById('diemdi__thongtinhanhtrinh').innerHTML = document.getElementById(diemKhoiHanh).value;
        document.getElementById('diemden__thongtinhanhtrinh').innerHTML = document.getElementById(diemden).value;

        document.getElementById('songuoilon__thongtinhanhtrinh').innerHTML = document.getElementById(soHanhKach_nguoilon).value;
        document.getElementById('sotreem__thongtinhanhtrinh').innerHTML = document.getElementById(soHanhKach_treem).value;

        document.getElementById('ngaydi__thongtinhanhtrinh').innerHTML = document.getElementById(departure_date).value;
        document.getElementById('ngayve__thongtinhanhtrinh').innerHTML = document.getElementById(return_date).value;

        document.getElementById('loaichuyenbay__thongtinhanhtrinh').innerHTML = loaichuyenbay;
    }
    return check;
}