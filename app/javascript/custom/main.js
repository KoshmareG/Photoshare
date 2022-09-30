// Dropdown

function dropdown(elementId) {
    document.getElementById(elementId).classList.toggle("is-active");
}

window.dropdown = dropdown;

window.onclick = function(event) {
    if (!event.target.matches('.btn')) {
        var dropdowns = document.getElementsByClassName("dropdown");
        var i;
        for (i = 0; i < dropdowns.length; i++) {
            var openDropdown = dropdowns[i];
            if (openDropdown.classList.contains("is-active")) {
                openDropdown.classList.remove("is-active");
            }
        }    
    }
}

// Resize textarea

var textArea = document.getElementById("resize-textarea")

if (textArea) textArea.oninput = function() {
    var limit = 280;
    textArea.style.height = 28;
    textArea.style.height = Math.min(textArea.scrollHeight, limit)+"px";
}

// Submit file

window.submitFile = submitFile;

function submitFile(buttonId) {
    var button = document.getElementById(buttonId);
    if (button) button.click();
}

// Image carousel

window.switchSlide = switchSlide;

let slideIndex = 1;
showSlides(slideIndex);

function switchSlide(n) {
    showSlides(slideIndex += n);
}

function showSlides(n) {
    let i;
    let slides = document.getElementsByClassName("slide");
    if (n > slides.length) {slideIndex = 1}
    if (n < 1) {slideIndex = slides.length}
    if (slides) {
        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slides[slideIndex-1].style.display = "block";
    }
}

document.addEventListener("DOMContentLoaded", showSlides(slideIndex));

// Dropdown list

window.dropdownList = dropdownList

function dropdownList(elementId) {
    document.getElementById(elementId).classList.toggle("hidden");
}
