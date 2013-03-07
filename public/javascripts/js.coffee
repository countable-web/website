
$.fn.screenOffset = ->
  offs = $(this).offset()

  return {
    top: offs.top - $(window).scrollTop(),
    left: offs.left
  }

$ ->

  #smoothAnchors();
  # carousel demo
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


  lastMouseCheck = (new Date()).valueOf()
  xx = 0
  yy = 0
  event = null
  t = 0
  v = 0
  theta = 0

  $('body').mousemove (e)->
    return unless (curMouseMove = (new Date()).valueOf()) - lastMouseCheck > 40
    lastMouseMove = curMouseMove
    event = e

  setInterval ->
    
    return unless event

    t += 1

    # the force.
    dx = event.pageX - xx

    xx = event.pageX

    v = (v + dx) * .9
    theta += v * Math.PI / 1800

    $('.howto').each ->

      y = Math.sin(theta + ($(this).attr('phase') or 0)) * 100
      x = Math.cos(theta + ($(this).attr('phase') or 0)) * 100

      #$(this).css 'transform': 'translateX(' + x + 'px) translateY(' + y + 'px)'

  , 60

  #$('.howto').mouseover ->
  #  $(this).css 'transform': 'scale( 1.2, 1.2 )'

