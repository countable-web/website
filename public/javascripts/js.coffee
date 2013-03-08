
$.fn.screenOffset = ->
  offs = $(this).offset()

  return {
    top: offs.top - $(window).scrollTop(),
    left: offs.left
  }

$ ->

  $(".nav").localScroll {}
  
  $(".carousel").carousel()
  
  $(".parallax-layer").parallax mouseport: $(".parallax-viewport")

  $(window).resize(->
    $(".resize-page").css "min-height", $("body").height() + "px"
    $("[data-spy=\"scroll\"]").each ->
      $spy = $(this).scrollspy("refresh")
  ).resize()

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

  skrollr.init()


