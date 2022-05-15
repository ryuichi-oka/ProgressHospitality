$(document).on('turbolinks:load', function() {
  $('.js-objec-modal-open').on('click', function(){
    $('.js-objec-modal').fadeIn();
  });
  $('.js-objec-modal-close').on('click', function(){
    $('.js-objec-modal').fadeOut();
  });
});