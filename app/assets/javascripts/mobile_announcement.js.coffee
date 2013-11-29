$ ->
  $("#mobile-announcement").on "closed", (event) ->
    localStorage?.setItem("hideMobileAnnouncement", "true")

  unless localStorage?.getItem("hideMobileAnnouncement") == "true"
    $("#mobile-announcement").show()
