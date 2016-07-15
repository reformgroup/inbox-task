# Buttons
# Disable submit after click
$(document).on 'turbolinks:load', ->
  $('form').submit ->
    $(this).find(':submit:not(.not-disabled)').prop 'disabled', true
    return
  return