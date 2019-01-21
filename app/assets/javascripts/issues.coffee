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


this.show_todo_form = (issue_number) ->
  alert(issue_number)
  $("tr.todo-form-#{issue_number}").css('display', 'block')
