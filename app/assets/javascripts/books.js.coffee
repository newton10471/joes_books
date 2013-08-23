# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('form').submit ->
    #event.preventDefault();
    my_comment = $('#comment_text').val()
    $.ajax({
      type: 'POST',
      url: '/comments',
      dataType: 'json',
      data: { comment: {text: my_comment, book_id: 1} }
    })
    $("p:last").append("<p>" + my_comment + "</p>")
    return false
