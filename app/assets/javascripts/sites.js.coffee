$ ->
  init = ->
    $.get('/sites/pickup')
    return
  init() if $('body').hasClass('show_sites_pickup')
  return