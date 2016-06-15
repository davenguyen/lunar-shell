# Focuses input
focus_cli = ->
  $('#command_line').focus()

$ ->
  # Set on page load
  focus_cli()

  # Focus when clicking anywhere on the page
  $(document).click ->
    focus_cli()

# Set after running command
$(document).ajaxComplete ->
  focus_cli()
