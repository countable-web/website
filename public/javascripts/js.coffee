
$.fn.screenOffset = ->
  offs = $(this).offset()

  return {
    top: offs.top - $(window).scrollTop(),
    left: offs.left
  }

$(".resize-page").css "min-height", $(window).height() + "px"

$ ->
  
  $('.navbar').localScroll
    hash:true

  $(".carousel").carousel()
  
  $(".parallax-layer").parallax mouseport: $(".parallax-viewport")

  $(window).resize(->
    $(".resize-page").css "min-height", $(window).height() + "px"
  ).resize()
  
  #Contact
  $(".contact-us").click ->
    $("#contact").addClass "open"

  $("#contact .close-contact").click ->
    $("#contact").removeClass "open"

  $(".logo").animate
    "margin-top":"-240px",
    width:"960px",
    easing: 'easein',
  , 1000

  setTimeout ->
    $(".slogan").show().addClass("sloganimate")
  , 1000
    
  skrollrPages
    onpage:
      'credits': (opts)->
        console.log 'credits'
        $(opts.scroll_down_el).hide()
        $(opts.scroll_top_el).show()
    offpage:
      'credits': (opts)->
        console.log 'off'
        $(opts.scroll_down_el).show()
        $(opts.scroll_top_el).hide()
