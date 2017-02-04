# # On load
$(document).on 'turbolinks:load', ->
  $('a.add-nested-object').click (e) ->
    e.preventDefault()
    
    url = $(this).attr('href')
    # TODO: to simplify the selector
    # data = $(this).closest('.new-nested-object').find('input, textarea, select').serialize()
    data = $(this).closest('.new-nested-object').find('select').val()
    
    alert data
    
    $.ajax
      url: url
      data: 
        user_id: data
      dataType: 'script'

  $('.autocomplete.autocomplete-search').autocomplete
    minLength: 1
    source: $('.autocomplete.autocomplete-search').data('autocomplete-source')
    focus: (event, ui) ->
      $('.autocomplete.autocomplete-search').val ui.item.label
      false
    select: (event, ui) ->
      $('.autocomplete.autocomplete-search').val ui.item.label
      $('.autocomplete.autocomplete-value').val ui.item.value
      false

# # Delete nested item
# removeNestedObject = (element, objName) ->
#   $("[name='"+objName+"[_destroy]']").val(true)
#   $(element).closest('.removable-nested-fields').remove()
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