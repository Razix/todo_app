$(document).on "click", "#paginator a", ->
  $.getScript @href
  false
