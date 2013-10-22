$ ->
  $('#todos').on 'click', 'input[type=checkbox]', ->
    $(this).parent('form').submit()