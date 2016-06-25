$('#shell-history').append('<div class="output">Just ran "<%= plural_name.singularize %>"!</div>');
$('#shell-cli').html('<%%= j render('lunar_shell/shells/cli') %>');
