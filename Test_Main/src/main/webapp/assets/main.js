let recomentlist = [
    "Hà Nội",
    "Hồ Chí Minh",
    "Đà Nẵng",
    "Hải Phòng",
    "Cần Thơ",
    "Nha Trang",
    "Huế",
    "Đồng Nai",
    "Phú Quốc",
    "Quảng Ninh",
]

const inputSearch = document.querySelector(".input-search")
const outputSearch = document.querySelector(".output-search")
const innerAutoBox = document.querySelector(".innerAutoBox")
const innerAutoBoxOut = document.querySelector(".innerAutoBox-o")
const autobox = document.querySelector(".autobox")
const autoboxOut = document.querySelector(".autobox-o")
// Input search
inputSearch.onkeyup = (e) => {
    let value = e.target.value
    let dataArray = []
    if (value) {
        dataArray = recomentlist.filter((item) => {
            return item.toLocaleLowerCase().startsWith(value.toLocaleLowerCase())
        })
        // console.log(dataArray)
        dataArray = dataArray.map((item) => {
            return item = `<li>${item}</li>`
        })
        autobox.classList.add("active")
        showAddress(dataArray)
        let liItem = autobox.querySelectorAll("li")
        for (let i = 0; i < liItem.length; i++) {
            liItem[i].addEventListener("click", () => {
                inputSearch.value = liItem[i].textContent
                autobox.classList.remove("active")
            })
        }
    } else {
        autobox.classList.remove("active")
    }
}
function showAddress(list) {
    let listData
    if (!list.length) {
        listData = `<li>${inputSearch.value}</li>`
    } else {
        listData = list.join('')
    }
    innerAutoBox.innerHTML = listData
}
// Output search
outputSearch.onkeyup = (e) => {
    let value = e.target.value
    let dataArray = []
    if (value) {
        dataArray = recomentlist.filter((item) => {
            return item.toLocaleLowerCase().startsWith(value.toLocaleLowerCase())
        })
        dataArray = dataArray.map((item) => {
            return item = `<li>${item}</li>`
        })
        autoboxOut.classList.add("active")
        showAddressOut(dataArray)
        let liItem = autoboxOut.querySelectorAll("li")
        for (let i = 0; i < liItem.length; i++) {
            liItem[i].addEventListener("click", () => {
                outputSearch.value = liItem[i].textContent
                autoboxOut.classList.remove("active")
            })
        }
    } else {
        autobox.classList.remove("active")
    }
}
function showAddressOut(list) {
    let listData
    if (!list.length) {
        listData = `<li>${outputSearch.value}</li>`
    } else {
        listData = list.join('')
    }
    innerAutoBoxOut.innerHTML = listData
}
// Count Passenger 
const inputNumber = document.querySelector(".number-people")
const numberBox = document.querySelector(".number-box")
const numberClose = document.querySelector(".number-close")

inputNumber.addEventListener("click", () => {
    numberBox.classList.toggle("active")
})
numberClose.addEventListener("click", () => {
    numberBox.classList.remove("active")
})
const minusAdult = document.querySelector(".minus-adult")
const plusAdult = document.querySelector(".plus-adult")
const adultValue = document.querySelector(".adult span")
let i = 0
plusAdult.addEventListener("click", () => {
    i++
    adultValue.textContent = i
    totalNumber()
})
minusAdult.addEventListener("click", () => {
    if (i<=0) {
        i = 0
    } else {
        i--
        adultValue.textContent = i
        totalNumber()
    }
})

const minusChild = document.querySelector(".minus-child")
const plusChild = document.querySelector(".plus-child")
const childValue = document.querySelector(".child span")
let j = 0
minusChild.addEventListener("click", () => {
    if (j<=0) {
        j = 0
    } else {
        j--
        childValue.textContent = j
        totalNumber()
    }
})
plusChild.addEventListener("click", () => {
    j++
    childValue.textContent = j
    totalNumber()
})

function totalNumber() {
    let total = i + j
    // inputNumber.value = total + " " + "người"
    inputNumber.value = i + " " + "người lớn" + ", " + j + " " + "trẻ em"
}
// Search 
const btnSearch = document.querySelector(".btn-search")
let departDate = document.querySelector('.depart-date');
let returnDate = document.querySelector('.return-date');
const filterBar = document.querySelector(".filter-bar")

btnSearch.addEventListener("click", () => {
    filterBar.classList.add("active")
})

// Only select economy or business
document.addEventListener("DOMContentLoaded", function() {
    const flightItems = document.querySelectorAll(".flight-item");

    flightItems.forEach(function(item) {
        const radios = item.querySelectorAll('input[type="radio"]');
        
        radios.forEach(function(radio) {
            radio.addEventListener("click", function() {
                // Loại bỏ lựa chọn trên tất cả các nút radio trong cùng một flight item
                radios.forEach(function(otherRadio) {
                    if (otherRadio !== radio) {
                        otherRadio.checked = false;
                    }
                });
            });
        });
    });
});

const flightItems = document.querySelectorAll('.flight-item');
        const col2 = document.querySelector('.col-2');

        flightItems.forEach(item => {
            item.addEventListener('dblclick', () => {
                const clone = item.cloneNode(true); // Sao chép flight item
                col2.appendChild(clone); // Thêm vào col-2

                // Thêm nút Save and Close nếu chưa có
                if (!col2.querySelector('.save-close-button')) {
                    const button = document.createElement('button');
                    button.textContent = 'Save and Close';
                    button.classList.add('save-close-button');
                    button.addEventListener('click', () => {
                        // Lưu các vé đã chọn và tính tổng giá
                        saveAndClose();
                    });
                    col2.appendChild(button);
                }
            });
        });

        function saveAndClose() {
            // Lưu các vé đã chọn và tính tổng giá ở đây
        }