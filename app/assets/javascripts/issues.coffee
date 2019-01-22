# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
this.expand = (id) ->
  expand = $("#check_#{id}").prop("checked")
  to_be_expanded = $("#issue_extra_#{id}")
  if expand
    to_be_expanded.css('display', 'block')
  else
    to_be_expanded.css('display', 'none')

this.show_todo_form = (id) ->
  expand = $("#show-todo-form_#{id}").prop("checked")
  to_be_expanded = $("#todo-form-#{id}")
  if expand
    to_be_expanded.css('display', 'block')
  else
    to_be_expanded.css('display', 'none')
