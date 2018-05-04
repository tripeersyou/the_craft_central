// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require Chart.bundle
//= require chartkick
//= require jquery
//= require select2
//= require cocoon
//= require semantic-ui
//= require_tree .

$(document).on('turbolinks:load', function () {
    $('#import_help').click(function () {
        $('.ui.modal').modal('show');
    });
    $('#loader').css('display', 'none');
    $('.message .close').on('click', function () {
        $(this).closest('.message').transition('fade');
    });
    $('.dropdown').dropdown();
    $('.basic.button').mouseover(function () {
        $(this).removeClass('basic')
    });
    $('.basic.button').mouseleave(function () {
        $(this).addClass('basic')
    });
    $('input[type="submit"]').click(function(){
        $('#loader').css('display', 'block');
    });
});

$(document).on('turbolinks:request-start', function(){
    $('#loader').css('display', 'block');
});