jQuery ->
  timeout_id = setTimeout ->
    $('.alert-success').animate({opacity: 'hide'}, {duration: 500})
  , 2000
