// jQuery.fn.submitOnCheck = function() {
//   this.find('input[type=submit]').remove();
//   this.find('input[type=checkbox]').click(function() {
//     $(this).parent('form').submit();
//   });
//   return this;
// }

// $(function() {
//   $('.edit_todo').submitOnCheck();
// });


$(document).bind("DOMSubtreeModified", function() {
  $('.edit_todo input[type=submit]').remove();
  $('.edit_todo input[type=checkbox]').click(function() {
    $(this).parent('form').submit();
  });
});

