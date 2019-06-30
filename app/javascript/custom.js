console.log('Hello World from Webpacker')
$(() => {
  document.getElementById('password_button').addEventListener('click', function(e) {
    e.preventDefault();
    e.stopPropagation();
    alert('hi');
    return false;
  });
});
