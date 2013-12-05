# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
    $(".center").change ->
        center = $(".center").val()
        console.log(center)
        $.ajax({url: '/students/' + center + '/center_days_partial'})
        $("#days_field").show();

$(document).ready ->
    $(".center_edit").change ->
        center = $(".center_edit").val()
        console.log(center)
        $.ajax({url: '/students/' + center + '/center_days_partial'})
        $("#days_edit_field").show();
        
