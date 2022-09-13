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
