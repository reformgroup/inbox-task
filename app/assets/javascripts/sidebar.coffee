# Sidebar on page render
$(document).on 'turbolinks:render', ->
  if localStorage.getItem("sidebar_hidden") == 'hidden'
    $('#wrapper').addClass('toggled')
  else
    $('#wrapper').removeClass('toggled')
    
# Sidebar togle  
$(document).on 'turbolinks:load', ->
  $('#menu-toggle').click (e) ->
    e.preventDefault()
    if $('#wrapper').hasClass('toggled')
      $('#wrapper').removeClass('toggled')
      localStorage.removeItem("sidebar_hidden")
    else
      $('#wrapper').addClass('toggled')
      localStorage.setItem("sidebar_hidden", 'hidden')
    return
  return