$(document).on "click", "#todos th a", ->
  $.getScript @href
  false
