# # Autocomplete plagin
#
$.fn.customAutocomplete = ->
  @each (i, el) ->
    el = $(el)
    el.autocomplete
      minLength: 1
      source: el.data('autocomplete-source')
      focus: (event, ui) ->
        el.val ui.item.label
        el.data 'email', ui.item.email
        false
      select: (event, ui) ->
        el.val ''
        el.next('.autocomplete.autocomplete-value').val ui.item.value
        
        url = el.data("new-nested-object-path")
        data = $('.new-nested-group :input, .new-nested-object').serialize()
        
        $.ajax
          url: url
          data: data
          dataType: 'script'
        false
  # TODO: if you change the search field to clear the field values
  # $(this).on 'change keydown paste input', ->
  #   $(this).next('.autocomplete.autocomplete-value').val ''

# # Delete nested item
removeNestedObject = (element, objName) ->
  $("[name='"+objName+"[_destroy]']").val true
  $(element).closest('.removable-nested-object').remove()

$(document).on 'click', 'a.remove-nested-object', ->
  objName = $(this).data('object-name')
  removeNestedObject(this, objName)

# # On load
#
$(document).on 'turbolinks:load', ->
  # $(".add-nested-object").on("ajax:success", (e, ajaxData, status, xhr) ->
  #   $(".nested-objects").append xhr.responseText
  #  ).on "ajax:error", (e, xhr, status, error) ->
  #   $(".nested-objects").append "<p>ERROR</p>"
  
  $('a.add-nested-object').click (e) ->
    e.preventDefault()
    
    # TODO: to simplify the selector
    # data = $(this).closest('.new-nested-object').find('input, textarea, select').serialize()
    # data = $(this).closest('.new-nested-object').find('select').val()
    
    url = @href
    data = $('.new-nested-group :input, .new-nested-object').serialize()

    $.ajax
      url: url
      data: data
      dataType: 'script'
  
  $('.autocomplete.autocomplete-search').customAutocomplete()

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