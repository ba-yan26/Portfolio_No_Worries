/*global $*/
$(document).on('turbolinks:load', 
function(){
  $('.trigger').on('click', function(event) {
    $(this).toggleClass('active');
    $('.drop-menu').slideToggle();
    event.preventDefault();
  });
});