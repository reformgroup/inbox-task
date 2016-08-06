# Sidebar on page render
$(document).on 'turbolinks:render', ->
  # Show or hide sidebar
  if localStorage.getItem('sidebar_hidden') == 'hidden'
    $('#wrapper').addClass('toggled')
  else
    $('#wrapper').removeClass('toggled')
    
  # Show or hide submenu
  # for i in localStorage.getItem("submenu_open").split(',')
    
# Sidebar and submenu togle
$(document).on 'turbolinks:load', ->
  # TODO: Need to develop
  # $('.nav-link').click (e) ->
  #   e.preventDefault()
  #   if this.getAttribute('aria-expanded') == 'false'
  #     localStorage.setItem('submenu_open', this.getAttribute('aria-controls'))
  #   else
  #     localStorage.removeItem('submenu_open')
  #   return

  $('#menu-toggle').click (e) ->
    e.preventDefault()
    if $('#wrapper').hasClass('toggled')
      $('#wrapper').removeClass('toggled')
      localStorage.removeItem("sidebar_hidden")
    else
      $('#wrapper').addClass('toggled')
      localStorage.setItem('sidebar_hidden', 'hidden')
    return
  return
  
