$(document).ajaxComplete ->
  $('.su_form').submit (e) ->
    $('#shell-history').append "<div class=\"history-io history-io-input\"></div>"
    $('.input').last().append $('.su_form label').text()
