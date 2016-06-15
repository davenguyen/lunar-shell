# Focuses input
focus_cli = ->
  $('#command_line').focus()

form_submit = ->
  $('#cli').submit (e) ->
    e.preventDefault()
    $('#shell-history').append "<div class=\"input\"></div>"
    $('#shell-cli .prompt').clone().appendTo('#shell-history .input:last')
    $('.input').last().append $('#command_line').val()

$ ->
  # Set on page load
  focus_cli()
  form_submit()

  # Focus when clicking anywhere on the page
  $(document).click ->
    focus_cli()

# Set after running command
$(document).ajaxComplete ->
  focus_cli()
  form_submit()
