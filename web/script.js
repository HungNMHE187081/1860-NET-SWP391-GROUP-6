let mybutton = document.getElementById("backToTop");
let isScrolling = false;

// Detect when the user scrolls
window.onscroll = function () { scrollFunction() };

function scrollFunction() {
    if (!isScrolling) {
        if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
            mybutton.style.display = "block";
        } else {
            mybutton.style.display = "none";
        }
    }
}

// Smooth scrolling function with easing
function scrollToTop(scrollDuration) {
    var scrollStep = -window.scrollY / (scrollDuration / 15),
        scrollInterval = setInterval(function () {
            if (window.scrollY != 0) {
                window.scrollBy(0, scrollStep);
            } else clearInterval(scrollInterval);
        }, 15);
}

// Easing function for smoother scrolling
function easeInOutQuad(t, b, c, d) {
    t /= d / 2;
    if (t < 1) return c / 2 * t * t + b;
    t--;
    return -c / 2 * (t * (t - 2) - 1) + b;
}

// When the button is clicked, scroll to the top smoothly
mybutton.onclick = function () {
    scrollToTopWithEasing(1000);
}

// Smooth scrolling with easing
function scrollToTopWithEasing(duration) {
    const start = window.scrollY;
    const startTime = performance.now();

    function scrollStep(timestamp) {
        const currentTime = timestamp || performance.now();
        const elapsedTime = currentTime - startTime;

        window.scrollTo(0, easeInOutQuad(elapsedTime, start, -start, duration));

        if (elapsedTime < duration) {
            requestAnimationFrame(scrollStep);
        }
    }

    requestAnimationFrame(scrollStep);
}

// Listen for mousewheel event to track scrolling
window.addEventListener("wheel", function () {
    isScrolling = true;
    setTimeout(function () {
        isScrolling = false;
    }, 200);
});

// header
let lastScrollTop = 0;
const headerContainer = document.getElementById("headerContainer");

// Detect when the user scrolls
window.addEventListener("scroll", function () {
    let scrollTop = window.pageYOffset || document.documentElement.scrollTop;

    if (scrollTop > lastScrollTop) {
        // Scrolling down
        headerContainer.style.top = "-140px";
    } else {
        // Scrolling up
        headerContainer.style.top = "0";
    }

    lastScrollTop = scrollTop;
});

//color
const rainbowText = document.getElementById("rainbowText");
let isChangingColor = false; // Flag to track if the color change animation is running

// Array of hue values for rainbow colors
const rainbowHues = [0, 45, 90, 135, 180, 225, 270, 315];

let hueIndex = 0; // Start with the first hue in the array

// Function to change the hue of the text color smoothly
function changeColor() {
    // Calculate the hue value for the next color in the rainbowHues array
    const nextHue = rainbowHues[hueIndex];

    // Set the text color to the next hue value
    rainbowText.style.color = `hsl(${nextHue}, 100%, 50%)`;

    // Increment the hue index, and loop back to the beginning if it exceeds the array length
    hueIndex = (hueIndex + 1) % rainbowHues.length;
}

// Function to start or stop the color change animation
function toggleColorChange() {
    if (!isChangingColor) {
        // Start changing the color with an interval of 200 milliseconds
        colorChangeInterval = setInterval(changeColor, 200);
        isChangingColor = true;
    } else {
        // Stop changing the color
        clearInterval(colorChangeInterval);
        isChangingColor = false;
    }
}

// Add click event listener to the rainbow text
rainbowText.addEventListener("click", toggleColorChange);

document.addEventListener("DOMContentLoaded", function() {
    fetch('footer.html')
        .then(response => response.text())
        .then(data => {
            document.getElementById('footer').innerHTML = data;
        });
});

