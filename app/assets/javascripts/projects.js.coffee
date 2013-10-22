$(document).on "click", "#paginator a", ->
  $.getScript @href
  false
$ ->
  $(".project_image_container").on "change", "#project_image", ->
    unless $(this).val() is ""
      $(".project_image_url_container").hide()
    else
      $(".project_image_url_container").show()

  $(".project_image_url_container").on "change", "#project_remote_image_url", ->
    unless $(this).val() is ""
      $(".project_image_container").hide()
    else
      $(".project_image_container").show()