$(document).ajaxComplete ->
  $('.edit_user').submit (e) ->
    input =
    $('#shell-history').append "<div class=\"input\"></div>"
    $('.input').last().append $('.edit_user label').text()
