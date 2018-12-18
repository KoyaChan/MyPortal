# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
this.expand = (id) ->
  $("#issue_extra_#{id}").css('display', 'block')
