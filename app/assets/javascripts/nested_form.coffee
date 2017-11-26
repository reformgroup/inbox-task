$(document).on 'turbolinks:load', ->
  
  $('a.remove_fields').click (e) ->
    $(this).prev('input[type=hidden]').val('1')
    $(this).closest('fieldset').hide()
    e.preventDefault()
    false
  # # Autocomplete plagin
  #
  
  $('#search_team_users').autocomplete(
    source: $('#search_team_users').data('source')
    minLength: 1
    focus: (event, ui) ->
      $('#search_team_users').val ui.item.label
      false
    select: (event, ui) ->
      $('#search_team_users').val ''
      time    = new Date().getTime()
      regexp  = new RegExp($('#search_team_users').data('id'), 'g')
      $('#team-users').prepend $('#search_team_users').data('fields').replace regexp, time
      $('#team-users fieldset').first().prepend ui.item.content
      $('#team-users fieldset input:hidden').first().val ui.item.value
      # $('#search_team_users').before(ui.item.content + $('#search_team_users').data('fields').replace(regexp, time))
      false
  )
  
  #.autocomplete('#search_team_users')._renderItem = (ul, item) ->
  #  $('<li>').append('<div>Test' + item.label + '<br>' + item.desc + '</div>').appendTo ul
# Start delete 22/08/2017
# $.fn.customAutocomplete = ->
#   @each (i, el) ->
#     el = $(el)
#     el.autocomplete
#       minLength: 1
#       source: el.data('autocomplete-source')
#       focus: (event, ui) ->
#         el.val ui.item.label
#         el.data 'email', ui.item.email
#         false
#       select: (event, ui) ->
#         el.val ''
#         el.next('.autocomplete.autocomplete-value').val ui.item.value
#
#         url = el.data("new-nested-object-path")
#         data = $('.new-nested-group :input, .new-nested-object').serialize()
#
#         $.ajax
#           url: url
#           data: data
#           dataType: 'script'
#         false
# End delete 22/08/2017
  # TODO: if you change the search field to clear the field values
  # $(this).on 'change keydown paste input', ->
  #   $(this).next('.autocomplete.autocomplete-value').val ''

# # Delete nested item

# Start delete 22/08/2017
# removeNestedObject = (element, objName) ->
#   $("[name='"+objName+"[_destroy]']").val true
#   $(element).closest('.removable-nested-object').remove()
#
# $(document).on 'click', 'a.remove-nested-object', ->
#   objName = $(this).data('object-name')
#   removeNestedObject(this, objName)

# End delete 22/08/2017

# # On load
#  
  # jQuery ->
#     $('form').on 'click', '.remove_fields', (event) ->
#       $(this).prev('input[type=hidden]').val('1')
#       $(this).closest('fieldset').hide()
#       event.preventDefault()
#
#     $('form').on 'click', '.add_fields', (event) ->
#       time = new Date().getTime()
#       regexp = new RegExp($(this).data('id'), 'g')
#       $(this).before($(this).data('fields').replace(regexp, time))
#       event.preventDefault()
      
  # $(".add-nested-object").on("ajax:success", (e, ajaxData, status, xhr) ->
  #   $(".nested-objects").append xhr.responseText
  #  ).on "ajax:error", (e, xhr, status, error) ->
  #   $(".nested-objects").append "<p>ERROR</p>"
  
  # Start delete 22/08/2017
  
  # $('a.add-nested-object').click (e) ->
  #   e.preventDefault()
  #
  #   # TODO: to simplify the selector
  #   # data = $(this).closest('.new-nested-object').find('input, textarea, select').serialize()
  #   # data = $(this).closest('.new-nested-object').find('select').val()
  #
  #   url = @href
  #   data = $('.new-nested-group :input, .new-nested-object').serialize()
  #
  #   $.ajax
  #     url: url
  #     data: data
  #     dataType: 'script'

  # End delete 22/08/2017

  # $('.autocomplete.autocomplete-search').customAutocomplete()

  # $('.autocomplete.autocomplete-search').on 'change keydown paste input', ->
  #   $(this).next('.autocomplete.autocomplete-value').val ''
  #
  # $('.autocomplete.autocomplete-search').each (i, el) ->
  #   el = $(el)
  #   el.autocomplete
  #     minLength: 1
  #     source: el.data('autocomplete-source')
  #     focus: (event, ui) ->
  #       el.val ui.item.label
  #       false
  #     select: (event, ui) ->
  #       el.val ui.item.label
  #       el.next('.autocomplete.autocomplete-value').val ui.item.value
  #       false


#
# addNestedObject = (link, association, content) ->
#   new_id = (new Date).getTime()
#   regexp = new RegExp('new_' + association, 'g')
#   $(link).parent().before content.replace(regexp, new_id)
#   return
#
# # On load
# $(document).on 'turbolinks:load', ->
#   $('a.remove-nested-object').click (e) ->
#     e.preventDefault()
#
#     objName = $(this).data("object-name")
#     removeNestedObject(this, objName)
#
#   $('a.add-nested-object').click (e) ->
#     e.preventDefault()
#
#     association = $(this).data("association")
#     content = $(this).data("content")
#
#     addNestedObject(this, association, content)