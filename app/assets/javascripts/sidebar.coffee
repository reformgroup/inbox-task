# Sidebar togle
$(document).on 'turbolinks:load', ->
  $('#menu-toggle').click (e) ->
    e.preventDefault()
    # setCookie 'sidebar', 'toggled'
    $('#wrapper').toggleClass 'toggled'
    if $('#wrapper').hasClass('toggled')
      setCookie 'sidebar', 'toggled'
    else
      deleteCookie 'sidebar'
    return
  return