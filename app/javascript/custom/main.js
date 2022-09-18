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
