// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function () {
    $('#index_form').submit(function (event) {
    });
    $('#product_brand_id').select2({
        tags: true
    });
    $('.ui.dropdown').dropdown();
});