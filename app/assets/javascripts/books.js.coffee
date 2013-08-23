# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('form').submit ->
    $.ajax({
      type: 'POST',
      url: '/comments',
      dataType: 'json',
      data: { comment: {text: "Comment from ajax", book_id: 1} }
    })
    return false
