/*global $*/
$(document).on('turbolinks:load',
function(){
  $('.trigger').on('click', function(event) {
    $(this).toggleClass('active');
    $('.drop-menu').slideToggle();
    event.preventDefault();
  });

  $('.comment-trigger').on('click', function(event) {
    $(this).toggleClass('active');
    $('.message-content').fadeToggle();
    event.preventDefault();
  });
  
  //fileを変更したら
  $('input').on('change', function () {
    //propを使って、file[0]にアクセスする
    var file = $(this).prop('files')[0];
    //text()で要素内のテキストを変更する
    $('.select-image').text(file.name);
  });




});