# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# this.expand = (id) ->
#   expand = $("#check_#{id}").prop("checked")
#   to_be_expanded = $("#issue_extra_#{id}")
#   if expand
#     to_be_expanded.css('display', 'block')
#   else
#     to_be_expanded.css('display', 'none')
# 
# this.show_todo_form = (id) ->
#   expand = $("#show-todo-form_#{id}").prop("checked")
#   to_be_expanded = $("#todo-form-#{id}")
#   if expand
#     to_be_expanded.css('display', 'block')
#   else
#     to_be_expanded.css('display', 'none')

expander = (checkbox_id, id_to_show) ->
  checked = $(checkbox_id).prop("checked")
  to_be_shown = $(id_to_show)

  if checked
    to_be_shown.css('display', 'block')
  else
    to_be_shown.css('display', 'none')

this.expand = (id) ->
  checkbox_id = $("#check_#{id}")
  id_to_show = $("#issue_extra_#{id}")
  expander(checkbox_id, id_to_show)
  
this.show_todo_form = (id) ->
  checkbox_id = $("#show-todo-form_#{id}")
  id_to_show = $("#todo-form-#{id}")
  expander(checkbox_id, id_to_show)

this.name_to_clipboard = (id) ->
  link_string = $("#logpath-#{id}").prop("name")
  $('body').append("<textarea id='copy-text'></textarea>")
  copy_from = document.getElementById("copy-text")
  copy_from.textContent = link_string
  copy_from.select()
  document.execCommand('copy')
  document.body.removeChild(copy_from)




