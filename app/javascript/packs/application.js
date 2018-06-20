import "bootstrap";


let  link = document.querySelector("#btn")
link.addEventListener('click', (event) => {
  let unhide = document.querySelector("#reviews")
  unhide.classList.toggle("hide")
})
