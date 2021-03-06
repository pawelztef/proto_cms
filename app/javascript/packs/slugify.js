$(() => {
  window.Pz = window.Pz || {};
  Pz.slugify = function(sourceInput, targetInput) { 
    if(sourceInput != null && targetInput != null) {
      sourceInput.addEventListener('keyup', function(e) {
        e.preventDefault();
        e.stopPropagation();
        targetInput.value = slugify(sourceInput.value);
      }); 
    }
  };
});

var slugify = function(text) {
  return text.toLowerCase()
    .replace(/\s+/g, '-')           // Replace spaces with -
    .replace(/[^\w\-]+/g, '')       // Remove all non-word chars
    .replace(/\-\-+/g, '-')         // Replace multiple - with single -
    .replace(/^-+/, '')             // Trim - from start of text
    .replace(/-+$/, '');            // Trim - from end of text
}
