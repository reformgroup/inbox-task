# Sidebar togle
$(document).ready ->
  $('#menu-toggle').click (e) ->
    e.preventDefault()
    $('#wrapper').toggleClass 'toggled'
    return
  return