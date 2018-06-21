import "bootstrap";


/*let  link = document.querySelector("#btn")
link.addEventListener('click', (event) => {
  let unhide = document.querySelector("#reviews")
  unhide.classList.toggle("hide")
})
*/


// Get the modal
let modal = document.getElementById('myModal');
// Get the button that opens the modal
let btn = document.getElementById("myBtn");
// Get the <span> element that closes the modal
let span = document.getElementsByClassName("close")[0];
btn.onclick = function() {
    modal.style.display = "block";
}
span.onclick = function() {
    modal.style.display = "none";
}
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
