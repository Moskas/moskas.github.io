   window.addEventListener("load", function () {
     const themeToggle = document.getElementById("theme-toggle");
     const themeLink = document.getElementById("theme-link");

     // Check the device's preferred color scheme
     const prefersDarkMode =
       window.matchMedia &&
       window.matchMedia("(prefers-color-scheme: dark)").matches;

     // Apply the appropriate theme based on the device's preferred color scheme
     if (prefersDarkMode) {
       themeToggle.checked = true;
       themeLink.href = "CSS/dark-theme.css";
     }

     // Toggle theme based on user preference
     themeToggle.addEventListener("change", function () {
       if (this.checked) {
         themeLink.href = "CSS/dark-theme.css";
       } else {
         themeLink.href = "CSS/light-theme.css";
       }
     });
   });
