

$ ->
  
  $('.navbar').localScroll
    hash:true

  $(".carousel").carousel()
  
  #$(".parallax-layer").parallax mouseport: $(".parallax-viewport")

  $(window).resize(->
    $(".resize-page").css "min-height", $(window).height() + "px"
  ).resize()
  
  #Contact
  $(".contact-us").click ->
    unless $("#contact").hasClass "open"
      $("#contact").addClass("opening").addClass("open")
      setTimeout ->
        $("#contact").removeClass("opening")
      , 1000

  $("#contact .close-contact").click ->
    $("#contact").addClass("closing").removeClass("open")
    setTimeout ->
      $("#contact").removeClass("closing")
    , 1000

  $(".logo").animate
    "margin-top":"-240px",
    width:"960px",
    easing: 'easein',
  , 1000

  setTimeout ->
    $(".slogan").show().addClass("sloganimate")
    $(".logo").animate
      opacity:0.2,
    , 1000
      
  , 1000
    
  skrollrPages()
  ###
    onpage:
      'credits': (opts)->
        $(opts.scroll_down_el).hide()
        $(opts.scroll_top_el).show()
    offpage:
      'credits': (opts)->
        $(opts.scroll_down_el).show()
        $(opts.scroll_top_el).hide()
  ###