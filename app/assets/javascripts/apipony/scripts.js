$(document).ready(function() {
  $('.endpoint h3').on('click', function() {
    if($(this).next('.more').length > 0) {
      $(this).next('.more').slideToggle();
      $(this).prev('.line').toggle();
    }
  });
});
