
// xử lý sự kiện trên form 
$(document).ready( function(){
    // Xử lý sự kiện khi người dùng nhấp chuột bên ngoài phần tử
   $(document).on("click", function(e) {
    var $target = $(e.target);
    if($target.is($(".dangky")) || $target.is($("._dangky"))) {
        $(".navbar__dangKy").fadeIn("1000")
    }
    else
    // Kiểm tra xem người dùng đã nhấp chuột bên ngoài phần tử hay không
    if (!$target.is($(".navbar__dangKy")) && !$target.closest($(".navbar__dangKy")).length && $(".navbar__dangKy").is(":visible")) {
        $(".navbar__dangKy").hide(); // Ẩn phần tử
    }
});
})
$(document).ready( function(){
    /**
    *  CODE sử lý sự kiện form dang ký
    */
    $(".navbar__formdangky__icon-exit").click(function formErrollClose() {
        $(".navbar__dangKy").hide();
    });
})
// hết phần xử lý sự kiện trên form 

/**
 *  code chuẩn hóa ngày sinh
 */

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
};

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
 *  code tạo thẻ moble Country form dang ky
 */

function MobileCountry() {
     var MmbileCountrys = new Array (
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
//  kết thúc phần code sự kiện cho form enroll


// kiểm tra inputdangky
function kiemtraInputDangKy( fulltNameSignUp,enroll_birth_date, enroll_birth_month, enroll_birth_year, companyCity,memberEmailSignUp,mobileNumberSignUp,memberPasswordSignIn,dongyVoiDieuKhoan,nhanthongbao)
{   
    var check=true;

    if (!required(fulltNameSignUp))
    {
         check= false
    } else if (!allLetter(fulltNameSignUp)){ 
        check = false;
    }

    var giaTri_birth_date = document.getElementById(enroll_birth_date).value;
    var giaTri_birth_month = document.getElementById(enroll_birth_month).value;
    var giaTri_birth_year = document.getElementById(enroll_birth_year).value;
    
    if (giaTri_birth_month < 10) {
        giaTri_birth_month = '0' + giaTri_birth_month;
    }
    if (giaTri_birth_date < 10) {
        giaTri_birth_date = '0' + giaTri_birth_date;
    }
    var birthdate=giaTri_birth_year+'-'+giaTri_birth_month+'-'+giaTri_birth_date;
    if (!isValidDate(birthdate)) {
        document.getElementById(enroll_birth_date).value=""
        check=false
    }
    if (!required(enroll_birth_date)) check= false
    if (!required(enroll_birth_month)) check= false
    if (!required(enroll_birth_year)) check= false

   if (!required(companyCity)) 
   { check= false
   } else if (!allLetter(companyCity)) check= false

    if (!required(memberEmailSignUp)) 
    {
        check= false
    } else if (!kiemtraEmailHopLe(memberEmailSignUp)){
        check = false;
    }

    if (!required(mobileNumberSignUp)){
        check= false
    } else if (!kiemTraTatCaLaSo(mobileNumberSignUp)){
        check = false;
    } 

    if (!required(memberPasswordSignIn)) check= false

    var checkbox = document.getElementById(dongyVoiDieuKhoan);
    var theP =  (checkbox.nextElementSibling).nextElementSibling;
    if (checkbox.checked) {
        theP.style.display = "none";
        check = true;
    } else {
        theP.style.display = "block";
        theP.innerHTML = "*Vui lòng xem chi tiết điều khoản!"
        check = false;
    }

    return check;
}