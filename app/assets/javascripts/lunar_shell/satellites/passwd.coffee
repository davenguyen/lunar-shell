$(document).ajaxComplete ->
  if $('.passwd_form').length
    $('.input_field').keypress (e) ->
      if e.which == 13
        e.preventDefault()
        $('#shell-history').append "<div class=\"input\"></div>"
        $('.input').last().append $('.passwd_form label').text()
        $('.passwd_form').submit()
