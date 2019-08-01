// const modal = document.getElementById('attachment-modal');
// const modalCloseBtn = document.getElementById('close-modal-btn');
// const modalContainer = document.getElementById('pz-modal-container'); 

// if(modalContainer != null) {
//   modalContainer.addEventListener('change', function() {
//     if(modalCloseBtn != null) {
//       modalCloseBtn.addEventListener('click', closeModal);
//     }
//   });
// }


// window.addEventListener('click', clickOutside);

// function closeModal() {
//   modal.style.display = 'none';
// }
// function clickOutside(e) {
//   if(e.target == modal) {
//     modal.style.display = 'none';
//   }
// }

$(() => {
  window.Pz = window.Pz || {};
  Pz.modal = window.Pz.modal || {};



  Pz.modal.close =  function(element) {
    const modal = document.getElementById('attachment-modal');
    const modalCloseBtn = document.getElementById('close-modal-btn');
    const modalContainer = document.getElementById('pz-modal-container'); 
    console.log(element);
    return this;
  }

  Pz.modal.init = function(element) {
    if(element != null) {
      openModal(element);
      modalContainer.addEventListener('change', function() {
        if(modalCloseBtn != null) {
          modalCloseBtn.addEventListener('click', closeModal);
        }
      });
    }

  }

  // if(modalContainer != null) {
  //   modalContainer.addEventListener('change', function() {
  //     if(modalCloseBtn != null) {
  //       modalCloseBtn.addEventListener('click', closeModal);
  //     }
  //   });
  // }


  // window.addEventListener('click', clickOutside);

  function closeModalByButton(modal) {
    modal.style.display = 'none';
  }

  function openModal(modal) {
    modal.style.display = 'block';
  }

  function closeModalByClickOutside(e) {
    if(e.target == modal) {
      modal.style.display = 'none';
    }
  }

});
