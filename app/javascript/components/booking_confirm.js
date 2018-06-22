function addConfirmEvents(){
const link = document.querySelector('#confirm');



document.querySelector('#confirm').addEventListener('click', (event) => {
  const canceled = document.querySelector('.booking-status-canceled')
  canceled.classList.add('hide')

  const status = document.querySelector('.booking-status-confirmed');
  status.classList.remove('hide')
  status.style.backgroundColor = 'green';
})


document.querySelector('#cancel').addEventListener('click', (event) => {
  const confirmed = document.querySelector('.booking-status-confirmed')
  confirmed.classList.add('hide')
  const statusCanceled = document.querySelector('.booking-status-canceled');
  statusCanceled.classList.remove('hide')
  statusCanceled.style.backgroundColor = 'red';
})

};

function addCancelEvents(){

}


export { addConfirmEvents,  addCancelEvents };
