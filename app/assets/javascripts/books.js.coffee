# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('form#new_comment').submit ->
    #event.preventDefault();
    my_comment = $('#comment_text').val()
    email = $('#current_user_id').text()
    book_id = $('#comment_book_id').val()
    $.ajax({
      type: 'POST',
      url: '/comments',
      dataType: 'html',
      data: { comment: {text: my_comment, book_id: book_id} }
    }).done (data) ->
      $("p:last").append(data)
    $('#comment_text').val('')
    #$("p:last").append("<p>" + my_comment + "</p><p>Posted at date by "+email+"</p>")
    return false

  $('button').click ->
    comment = $(this).parent()
    comment_id = comment.data('comment') 
    $.ajax({
      type: 'DELETE',
      url: '/comments/' + comment_id,
      dataType: 'html'
    }).done (data) ->
      comment.remove()
