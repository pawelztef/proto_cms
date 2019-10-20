$(() => {
  window.Pz = window.Pz || {};

  Pz.modal = function(modal, modalCloseBtn) {
    if(modalCloseBtn != null) {
      modalCloseBtn.addEventListener('click', function() {
        modal.style.display = 'none';
      });
    }
    window.addEventListener('click', function(e) {
      if(e.target == modal) {
        modal.style.display = 'none';
      }
    });
  };

  Pz.closeModal = function(modal) {
    if(modal) {
      console.log(modal)
      modal.style.display = 'none';
    }
  }
});
