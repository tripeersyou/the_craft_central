// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function () {
    function GetURLParameter(sParam){
        var sPageURL = window.location.search.substring(1);
        var sURLVariables = sPageURL.split('&');
        for (var i = 0; i < sURLVariables.length; i++) 
        {
            var sParameterName = sURLVariables[i].split('=');
            if (sParameterName[0] == sParam) 
            {
                return sParameterName[1];
            }
        }
    }
    $('#date_range').change(function () {
        console.log(GetURLParameter('start_date'));
        if (GetURLParameter('range')) {
            console.log(true);
        } else {
            console.log(false);
        }
    });
});