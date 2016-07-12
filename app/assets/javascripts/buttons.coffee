# Buttons
# Disable submit after click
$(document).ready ->
  $('form').submit ->
    $(this).find(':submit:not(.not-disabled)').prop 'disabled', true
    return
  return