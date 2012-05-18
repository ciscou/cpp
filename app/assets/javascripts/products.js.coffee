# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $("a.toggle-hideables").bind("click", ->
    $(this).parent().siblings(".hideable").slideToggle()
    text = $(this).html();
    $(this).html($(this).data("toggled-text"))
    $(this).data("toggled-text", text)
    return false
  )
