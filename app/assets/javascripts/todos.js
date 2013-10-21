$(function() {
  $('.edit_todo input[type=submit].todos_page').remove();
  $('.edit_todo input[type=checkbox]').on('click', function() {
    $(this).closest("form").submit();
  });
});