
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

  $('.scroll-down').click ->
    sections = ''

  setTimeout ->
    $(".slogan").show().addClass("sloganimate")
  , 1000

  $pages = $('.resize-page')
  $curpage = $lastpage = $pages.eq(0)
  
  skrollr.init
    render: (args)->
      $lastpage = $curpage
      $pages.each ->
        if args.curTop >= $(this).offset().top
          $curpage = $(this)

      if $curpage.attr('id') isnt $lastpage.attr('id')
        cur_page_id = $curpage.attr('id')
        $(".navbar li").removeClass 'active'
        $('[href="/#'+cur_page_id+'"]').parent().addClass 'active'
        window.location.hash = '#'+cur_page_id
  

