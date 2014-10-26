# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

attachedTags = []

splitString = (val) ->
  val.split(/,\s*/)

extractLast = (term) ->
  splitString(term).pop()

updateField = ->
  $('#idea_tags').val attachedTags.join(' ')

addTag = (tag) ->
  return unless tag

  return if attachedTags.indexOf(tag) isnt -1

  attachedTags.push tag

  tagElement = createTagElement tag, ->
    removeTag tagElement

  $('.tags').append tagElement

  updateField()

createTagElement = (tag, callback) ->
  tagElement = $('<span class="label label-info">').text(tag).val(tag)

  closeElement = $('<button type="button" class="close tag-close"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>')
  closeElement.click ->
    callback? tagElement

  tagElement.append closeElement

  return tagElement

removeTag = (tagElement) ->
  tag = tagElement.val()
  index = attachedTags.indexOf tag
  if index isnt -1
    attachedTags.splice index, 1

  tagElement.remove()

  updateField()

enterTag = (tag) ->
  elements = $('.autocomplete')

  tag ||= elements.val()
  addTag tag

  elements.val ''

enableAutoComplete = ->
  $.ui.autocomplete.filter = (array, term) ->
    matcher = new RegExp '^' + $.ui.autocomplete.escapeRegex(term), 'i'
    return $.grep array, (value) ->
      return matcher.test value.label || value.value || value

  elements = $('.autocomplete')
  if elements.length > 0
    attachedTags = []

    $.get '/tags', (res) ->
      tags = []
      for tag in res.tags
        tags.push tag.name

      elements.bind 'keydown', (event) ->
        if (event.keyCode is $.ui.keyCode.TAB && $(this).autocomplete('instance').menu.active)
          event.preventDefault()
        else if event.keyCode is 188 or event.keyCode is $.ui.keyCode.SPACE  # ',' or space
          event.preventDefault()
          enterTag()

      elements.autocomplete
        minLength: 1

        source: (request, response) ->
          term = extractLast request.term
          matchedTags = $.ui.autocomplete.filter tags, term

          existTags = splitString(request.term).slice 0, -1
          hitTags = $.map matchedTags, (tag) ->
            if attachedTags.indexOf(tag) is -1
              return tag
            else
              return null

          response hitTags

        focus: ->
          return false

        select: (event, ui) ->
          enterTag ui.item.value

          return false

        autoFocus: true

$(document).on 'ready page:load', ->
  enableAutoComplete()
