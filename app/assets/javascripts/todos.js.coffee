$ ->
  $('#todos').on 'click', 'input[type=checkbox]', ->
    $(this).closest('form').submit()