# Focuses input
focus_cli = ->
  $('#command_line').focus()

cli_submit = ->
  $('#cli').submit (e) ->
    input = $('#command_line').val()
    if input != 'clear'
      $('#shell-history').append "<div class=\"input\"></div>"
      $('#shell-cli .prompt').clone().appendTo('#shell-history .input:last')
      $('.input').last().append input

$ ->
  # Set on page load
  focus_cli()
  cli_submit()

  # Focus when clicking anywhere on the page
  $(document).click ->
    focus_cli()

# Set after running command
$(document).ajaxComplete ->
  focus_cli()
  cli_submit()
