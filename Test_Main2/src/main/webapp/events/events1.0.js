
/**
 *  code bat su kien hover va thay doi so luong hanh khach trang index1.0
 */

$(document).ready( function(){
    $(".btn_HienthiSoHK").click(function demSoHK() {
        $(".demSoKhachHang").show("slow");
        $(".timkiemchuyenbay__phantu--hienThiSoHanhKhach").css("border","2px solid  #605DEC")
        $(".timkiemchuyenbay__phantu--hienThiSoHanhKhach").css("border-radius","0.5rem")
    })

    $(".demSoKhachHang").mouseleave(function demSoHK() {
            $(".demSoKhachHang").hide("slow")
            $(".timkiemchuyenbay__phantu--hienThiSoHanhKhach").css("border","1px solid #CBD4E6")
            $(".timkiemchuyenbay__phantu--hienThiSoHanhKhach").css("border-right","none")
            $(".timkiemchuyenbay__phantu--hienThiSoHanhKhach").css("border-radius","0rem")
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
            $(".btn_HienthiSoHK").html(txt_btDemSoKH);
    })

    /** 
     * code bat su kien thay doi thanh pho den va di
    */
    $(".Diemden").mousedown(function thayDoiThanhPho() {
        var nameTP
        nameTP=$(this).text();
        $(".btn_diemDen").text(nameTP);
    })
    $(".diemkhoihanh").mousedown(function thayDoiThanhPho() {
        var nameTP
        nameTP=$(this).text();
        $(".btn_diemkhoihanh").text(nameTP);
    })

    /**
     * code chon lich bay 
     */

    $(".timkiemchuyenbay__chonlich__loaive").click(function checked_trip(){ 
        $(".timkiemchuyenbay__chonlich__ngayve").toggle();
    })
        /**
        *  CODE sử lý sự kiện form dang ký
        */
    $(".dangky").click(function formErrollOpen() {
        $(".navbar__dangKy").show("slow");
    });
    $(".navbar__formdangky__icon-exit").click(function formErrollClose() {
        $(".navbar__dangKy").hide("slow");
    });
})
    /**
     *  code chuẩn hóa ngày sinh
     */
    $("#picker-birthday").birthdayPicker({
        dateFormat: "littleEndian",
        monthFormat: "number",
        minAge: 2,
    });

    function setBirthDate() {
        var year = $("div#picker-birthday select.birthYear").val();
        var month = $("div#picker-birthday select.birthMonth").val();
        var day = $("div#picker-birthday select.birthDate").val();

        if (month == 0 || day == 0 || year == 0) {
            $('#txtDateOfBirth').val("");
        } else {
            if (month < 10) {
                month = '0' + month;
            }
            if (day < 10) {
                day = '0' + day;
            }
            var birdday = year + "-" + month + "-" + day;
            $('#txtDateOfBirth').val(birdday);
        }
    }


/**
 * code tạo thẻ năm trong form đăng ký
 */
function list_year() {
    const currentYear = new Date().getFullYear();
    const previousYear = currentYear - 2;
    const years = [];
    for (let i = 1933; i <= previousYear; i++) {
        years.push(i);
    }
    
    // Tạo thẻ select
    const selectElement = document.getElementById("enroll-birth-year");
    
    // Thêm các tùy chọn vào thẻ select
    years.forEach(year => {
        var optionElement=document.createElement("option");
        optionElement.value = year;
        optionElement.textContent = year;
        selectElement.appendChild(optionElement);
    });    
}
/**
 * code tạo thẻ tháng trong form đăng ký
 */
function list_month() {
    const months = [];
    for (let i = 1; i <= 12; i++) {
        months.push(i);
    }
    
    // Tạo thẻ select
    const selectElement = document.getElementById("enroll-birth-month");
    
    // Thêm các tùy chọn vào thẻ select
    months.forEach(month => {
        var optionElement=document.createElement("option");
        optionElement.value = month;
        optionElement.textContent = month;
        selectElement.appendChild(optionElement);
    });    
}
/**
 * code tạo thẻ ngày trong form đăng ký
 */
function list_date() {
    const dates = [];
    for (let i = 1; i <= 31; i++) {
        dates.push(i);
    }
    
    // Tạo thẻ select
    const selectElement = document.getElementById("enroll-birth-date");
    
    // Thêm các tùy chọn vào thẻ select
    dates.forEach(date => {
        var optionElement=document.createElement("option");
        optionElement.value = date;
        optionElement.textContent = date;
        selectElement.appendChild(optionElement);
    });    
}

/**
 *  code tạo thẻ moble Country
 */

function MobileCountry() {
     var MmbileCountrys = new Array (
        "AZERBAIJAN [994]",
        "VIET NAM [84]"
    )
    
    // Tạo thẻ select
    const selectElement = document.getElementById("ddlLotusMilesEnrollMobileCountry");
    
    // Thêm các tùy chọn vào thẻ select
    MmbileCountrys.forEach(MmbileCountry => {
        var optionElement=document.createElement("option");
        optionElement.value = MmbileCountry;
        optionElement.textContent = MmbileCountry;
        selectElement.appendChild(optionElement);
    });    
}

