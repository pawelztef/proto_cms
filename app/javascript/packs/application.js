/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

import Rails from 'rails-ujs';
import  DirectUpload  from "activestorage";
Rails.start();





import 'styles';
require('packs/custom.js.erb');
require('packs/hello_erb.js.erb');

require.context('../images', true);

$(() => {

  var bar = document.getElementById('js-progressbar');

  UIkit.upload('.js-upload', {

    url: '',
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
        success: function(data) { Rails.$(".random-number")[0].innerHTML = data.html; }
      });

    }
  });
})
