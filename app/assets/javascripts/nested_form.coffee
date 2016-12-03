# Delete nested item
removeNestedObject = (element, objName) ->
  $("[name='"+objName+"[_destroy]']").val(true)
  $(element).closest('.removable-nested-fields').remove()

addNestedObject = (link, association, content) ->
  new_id = (new Date).getTime()
  regexp = new RegExp('new_' + association, 'g')
  $(link).parent().before content.replace(regexp, new_id)
  return

# On load
$(document).on 'turbolinks:load', ->
  $('a.remove-nested-object').click (e) ->
    e.preventDefault()
    
    objName = $(this).data("object-name")
    removeNestedObject(this, objName)
  
  $('a.add-nested-object').click (e) ->
    e.preventDefault()
    
    association = $(this).data("association")
    content = $(this).data("content")
    
    addNestedObject(this, association, content)