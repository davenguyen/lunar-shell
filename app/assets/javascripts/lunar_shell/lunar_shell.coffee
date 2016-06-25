# Focuses input
focus_cli = ->
  $('.input_field').focus()

cli_submit = ->
  $('#cli').submit (e) ->
    input = $('#command_line').val()
    if input != 'clear'
      $('#shell-history').append "<div class=\"input\"></div>"
      $('#shell-cli .prompt').clone().appendTo('#shell-history .input:last')
      $('.input').last().append input

set_input_field_width = ->
  body_w = $('body').width()
  prompt_w = $('#shell-cli label').width()
  $('.input_field').width(body_w - prompt_w - 50)

$ ->
  # Set on page load
  focus_cli()
  cli_submit()
  set_input_field_width()

  # Focus when clicking anywhere on the page
  $(document).click ->
    focus_cli()

# Set after running command
$(document).ajaxComplete ->
  focus_cli()
  cli_submit()
  set_input_field_width()

$(window).on 'resize', ->
  set_input_field_width()
