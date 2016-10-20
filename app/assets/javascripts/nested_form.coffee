# Delete nested item
removeObject = (element, objName) ->
  $("[name='"+objName+"[_destroy]']").val(true)
  $(element).closest('.removable-nested-fields').remove()
 
$ ->
  $('a.remove-nested-fields').click (e) ->
    e.preventDefault()
    
    objName = $(this).data("object-name")
    removeObject(this, objName)