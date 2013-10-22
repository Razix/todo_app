$(function(){
  $('#todos').on('click', 'input[type=checkbox]', function() {
    $(this).parent('form').submit();
  });
})
