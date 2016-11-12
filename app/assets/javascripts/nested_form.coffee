# Delete nested item
removeObject = (element, objName) ->
  $("[name='"+objName+"[_destroy]']").val(true)
  $(element).closest('.removable-nested-fields').remove()
 
$(document).on 'turbolinks:load', ->
  $('a.remove-nested-fields').click (e) ->
    e.preventDefault()
    
    objName = $(this).data("object-name")
    removeObject(this, objName)