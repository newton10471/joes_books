# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('form').submit ->
    #event.preventDefault();
    my_comment = $('#comment_text').val()
    email = $('#current_user_id').text()
    $.ajax({
      type: 'POST',
      url: '/comments',
      dataType: 'html',
      data: { comment: {text: my_comment, book_id: 1} }
    }).done (data) ->
      $("p:last").append(data)
    $('#comment_text').val('')
    #$("p:last").append("<p>" + my_comment + "</p><p>Posted at date by "+email+"</p>")
    return false
