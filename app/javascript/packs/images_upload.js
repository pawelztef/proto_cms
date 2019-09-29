import Rails from 'rails-ujs';
$(() => {

  var bar = document.getElementById('js-progressbar');

  UIkit.upload('.js-upload', {
    url: '/admin/media',
    type: 'text/javascript',
    multiple: true,
    beforeSend: function () {
      console.log('beforeSend', arguments);
    },
    beforeAll: function () {
      console.log('beforeAll', arguments);
    },
    load: function () {
      console.log('load', arguments);
    },
    error: function () {
      console.log('error', arguments);
    },
    complete: function () {
      console.log('complete', arguments);
    },
    loadStart: function (e) {
      console.log('loadStart', arguments);
      bar.removeAttribute('hidden');
      bar.max = e.total;
      bar.value = e.loaded;
    },
    progress: function (e) {
      console.log('progress', arguments);
      bar.max = e.total;
      bar.value = e.loaded;
    },
    loadEnd: function (e) {
      console.log('loadEnd', arguments);
      bar.max = e.total;
      bar.value = e.loaded;
    },
    completeAll: function () {
      console.log('completeAll', arguments);
      setTimeout(function () {
        bar.setAttribute('hidden', 'hidden');
      }, 1000);
      Rails.ajax({
        url: "/admin/media",
        type: "get",
        success: function() {
          mediaCards = document.getElementsByClassName("uk-card-media");
          window.Pz.mediaCardsInit(mediaCards);
        }
      });
    }
  });

})
