// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function () {
    $('select').dropdown();
    $('form').on('cocoon:after-insert', function () {
        $('select').addClass('search selection');
        $('select').dropdown();
    });
    $('.card.store').mouseover(function () {
        $(this).css('box-shadow', '2px 2px lightgrey');
    });
    $('.card.store').mouseleave(function () {
        $(this).css('box-shadow', '');
    });
});