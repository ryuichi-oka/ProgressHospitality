$(document).on('turbolinks:load', function() {
  $('.js-group-modal-open').on('click', function(){
    $('.js-group-modal').fadeIn();
  });
  $('.js-group-modal-close').on('click', function(){
    $('.js-group-modal').fadeOut();
  });
});