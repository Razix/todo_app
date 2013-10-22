$(document).on "click", "#todos th a, #paginator a", ->
  $.getScript @href
  false
