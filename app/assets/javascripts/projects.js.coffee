$(document).on "click", "#todos th a, #todos .pagination a", ->
  $.getScript @href
  false