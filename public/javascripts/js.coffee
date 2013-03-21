
$.fn.screenOffset = ->
  offs = $(this).offset()

  return {
    top: offs.top - $(window).scrollTop(),
    left: offs.left
  }

$(".resize-page").css "min-height", $(window).height() + "px"

$ ->

  #$(".nav").localScroll {}
  
  $(".carousel").carousel()
  
  $(".parallax-layer").parallax mouseport: $(".parallax-viewport")

  $(window).resize(->
    $(".resize-page").css "min-height", $(window).height() + "px"
    #$("[data-spy=\"scroll\"]").each ->
    #  $spy = $(this).scrollspy("refresh")
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
    $new_place = $pages.eq($pages.index($curpage) + 1)
    if $new_place.length
      skrollr_instance.animateTo $new_place.offset().top


  setTimeout ->
    $(".slogan").show().addClass("sloganimate")
  , 1000

  $pages = $('.resize-page')
  $curpage = $lastpage = $pages.eq(0)
  skrollr_instance = undefined

  setTimeout ->
    skrollr_instance = skrollr.init
      render: (args)->
        $lastpage = $curpage
        for page in $pages.toArray()
          if args.curTop >= $(page).offset().top
            $curpage = $(page)
        
        # implement our own scrollSpy.
        if $curpage.attr('id') isnt $lastpage.attr('id') # and args.curTop > args.lastTop
          cur_page_id = $curpage.attr('id')
          $(".navbar li").removeClass 'active'
          $('[href="/#'+cur_page_id+'"]').parent().addClass 'active'
          # [cvo] who cares about the URL. (actually, it's too hard to make it sync up nice without jumping.)
          #window.location.hash = '#'+cur_page_id
  , 100

