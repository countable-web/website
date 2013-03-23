
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
  
  # A custom scrollspy implementation in skrollr, with some bonus features.
  # - Pagination "arrow" buttons.
  # - 
  # opts.callback. Called with the new skrollr instance.
  scrollPages = (opts)->
    
    opts = $.extend
        scroll_down_el: '.scroll-down'
        page_el: '.resize-page'
      , opts

    #Update page hash without scrolling.
    setHash = (hash)->

      hash = hash.replace(/^#/, "")
      fx = undefined
      node = $("#" + hash)
      if node.length
        node.attr "id", ""
        fx = $("<div></div>").css(
          position: "absolute"
          visibility: "hidden"
          top: $(document).scrollTop() + "px"
        ).attr("id", hash).appendTo(document.body)
      
      document.location.hash = hash
      
      if node.length
        fx.remove()
        node.attr "id", hash

    $(opts.scroll_down_el).click ->
      $new_place = $pages.eq($pages.index($curpage) + 1)
      if $new_place.length
        skrollr_instance.animateTo $new_place.offset().top
      else
        skrollr_instance.animateTo 0

    $pages = $(opts.page_el)
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
            
            cur_page_id = $curpage.attr 'id'
            old_page_id = $lastpage.attr 'id'

            # Activate links.
            $('[href="/#'+old_page_id+'"]').parent().removeClass 'active'
            $('[href="/#'+cur_page_id+'"]').parent().addClass 'active'

            # Update the URL hash.
            setHash cur_page_id

            # Update the arrows.
            if $curpage.attr('id') is 'credits'
              $(opts.scroll_down_el).find(i).removeClass('icon-arrow-down').addClass('icon-arrow-up')
            else
              $(opts.scroll_down_el).find(i).removeClass('icon-arrow-up').addClass('icon-arrow-down')
      
      opts.callback?(skrollr_instance)

    , 1
  
  scrollPages()
