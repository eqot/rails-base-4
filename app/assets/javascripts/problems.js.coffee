# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

enableMakrdownPreview = ->
  $('a[href=#preview]').on 'shown.bs.tab', ->
    data = {
      content: $('#write textarea').val()
    }

    $.post('/api/v1/markdown', data).done (html) ->
      $('#preview').html html

$(document).on "ready page:load", ->
  enableMakrdownPreview()
