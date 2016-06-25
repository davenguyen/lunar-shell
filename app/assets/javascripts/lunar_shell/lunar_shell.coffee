# Focuses input
focus_cli = ->
  $('.input_field').focus()

cli_submit = ->
  $('#cli').submit (e) ->
    input = $('#command_line').val()
    if clear_command(input)
      $('#shell-history').append "<div class=\"input\"></div>"
      $('#shell-cli .prompt').clone().appendTo('#shell-history .input:last')
      $('.input').last().append input

clear_command = (input) ->
  !(input == 'clear' || input.startsWith 'clear ')

set_input_field_width = ->
  body_w = $('body').width()
  prompt_w = $('#shell-cli label').width()
  $('.input_field').width(body_w - prompt_w - 50)

history_searchable = ->
  $('#command_line').keyup (e) ->
    search_history(e)

search_history = (e) ->
  e.preventDefault()
  dir = switch e.which
    when 38 then 'up'
    when 40 then 'down'
  $.post '/satellites/run.js', {command_line: 'history ' + dir} if dir?

$ ->
  # Set on page load
  focus_cli()
  cli_submit()
  set_input_field_width()
  history_searchable()

  # Focus when clicking anywhere on the page
  $(document).click ->
    focus_cli()

# Set after running command
$(document).ajaxComplete ->
  focus_cli()
  cli_submit()
  set_input_field_width()
  history_searchable()

$(window).on 'resize', ->
  set_input_field_width()
