# Footer
# Read the size of the window and reposition the footer at the bottom.
stickyFooter = ->
  pageHeight = $('html').height()
  windowHeight = $(window).height()
  footerHeight = $('footer').outerHeight()
  # A footer with 'fixed-bottom' has the CSS attribute "position: absolute",
  # and thus is outside of its container and counted in $('html').height().
  totalHeight = if $('footer').hasClass('fixed-bottom') then pageHeight + footerHeight else pageHeight
  $('body').css 'margin-bottom': footerHeight
  # If the window is larger than the content, fix the footer at the bottom.
  if windowHeight >= totalHeight
    $('footer').addClass 'fixed-bottom'
  else
    # If the page content is larger than the window, the footer must move.
    $('footer').removeClass 'fixed-bottom'

# Call when document is ready.
$(document).on 'turbolinks:load', ->
  stickyFooter()
  return
# Call again when the window is resized.
$(window).resize ->
  stickyFooter()
  return