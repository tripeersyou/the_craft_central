// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function(){
    $('input.select2-search__field').css('display','none');
    $('.select2-selection.select2-selection--multiple').css('width','100%');
});