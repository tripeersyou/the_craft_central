// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function () {
    $('#index_form').submit(function (event) {
        event.preventDefault();
    });

    $('#product_sort').change(function () {
        console.log(this.value);
    });
});