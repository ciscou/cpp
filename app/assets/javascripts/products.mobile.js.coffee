openImageInHash = ->
  if window.location.hash.length > 0
    console.log $("ul[data-clearing] a[data-hash=#{window.location.hash.substr(1)}]")
    $("ul[data-clearing] a[data-hash=#{window.location.hash.substr(1)}]").click()

$ ->
  setTimeout openImageInHash, 100
