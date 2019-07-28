const modal = document.getElementById('attachment-modal');
const modalCloseBtn = document.getElementById('close-modal-btn');
const modalContainer = document.getElementById('pz-modal-container'); 

if(modalContainer != null) {
  modalContainer.addEventListener('change', function() {
    if(modalCloseBtn != null) {
      modalCloseBtn.addEventListener('click', closeModal);
    }
  });
}


window.addEventListener('click', clickOutside);

function closeModal() {
  modal.style.display = 'none';
}
function clickOutside(e) {
  if(e.target == modal) {
    modal.style.display = 'none';
  }
}


