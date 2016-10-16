# Delete nested item
$(document).on 'turbolinks:load', ->
  $('a.remove').on 'click', (e) ->
    destroyField
    $(this).parents('.item').remove()
    $(this).parents('.item').append()
    return
  return