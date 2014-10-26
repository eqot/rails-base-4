# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

splitString = (val) ->
  val.split(/,\s*/)

extractLast = (term) ->
  splitString(term).pop()

enableAutoComplete = ->
  $.ui.autocomplete.filter = (array, term) ->
    matcher = new RegExp '^' + $.ui.autocomplete.escapeRegex(term), 'i'
    return $.grep array, (value) ->
      return matcher.test value.label || value.value || value

  elements = $('.autocomplete')
  if elements.length > 0
    $.get '/tags', (res) ->
      tags = []
      for tag in res.tags
        tags.push tag.name

      elements.bind 'keydown', (event) ->
        if (event.keyCode is $.ui.keyCode.TAB && $(this).autocomplete('instance').menu.active)
          event.preventDefault()

      elements.autocomplete
        minLength: 1

        source: (request, response) ->
          term = extractLast request.term
          matchedTags = $.ui.autocomplete.filter tags, term

          existTags = splitString(request.term).slice 0, -1
          hitTags = $.map matchedTags, (tag) ->
            if existTags.indexOf(tag) is -1
              return tag
            else
              return null

          response hitTags

        focus: ->
          return false

        select: (event, ui) ->
          terms = splitString this.value
          terms.pop()
          terms.push ui.item.value
          terms.push ''
          this.value = terms.join ', '

          return false

        autoFocus: true

$(document).on 'ready page:load', ->
  enableAutoComplete()
