# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('#ken').click ->
  #$('.btn-primary').click ->
  #event.preventDefault()
  #console.log 'iken'
    alert('hello')
    $.ajax({
      type: 'POST',
      url: '/',
      data: 'Ken Comment'
    })
    return false
