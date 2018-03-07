// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function () {
    $('#date_range').change(function () {
        window.location = '?range='+this.value;
    });
});