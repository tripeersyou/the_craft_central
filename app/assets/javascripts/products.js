// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function () {
    // $('#supplier_product_ids').select2();
    $('#product_brand_id').select2({
        tags: true
    });
});