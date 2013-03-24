
# Adds a concept of "pages" to skrollr, based on the url hash. In particular:
# - Easy pagination buttons.
# - "scrollspy" (activate hash links when you scroll to them manually).
# - Events based on scrolling onto or off any page.


module=
  exports:
    skrollrPages: (opts)->

      opts = $.extend
          scroll_down_el: '.scroll-page-down'
          scroll_up_el: '.scroll-page-up'
          scroll_top_el: '.scroll-page-top'
          scroll_bottom_el: '.scroll-page-bottom'
          page_el: '.page'
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

      $(opts.scroll_up_el).click ->
        $new_place = $pages.eq($pages.index($curpage) - 1)
        if $new_place.length
          skrollr_instance.animateTo $new_place.offset().top
      
      $(opts.scroll_top_el).click ->
        skrollr_instance.animateTo 0

      $(opts.scroll_bottom_el).click ->
        $new_place = $pages.filter(":last")
        if $new_place.length
          skrollr_instance.animateTo $new_place.offset().top

      $pages = $(opts.page_el)
      $curpage = $lastpage = $pages.eq(0)

      skrollr_instance = skrollr.init
        render: (args)->
          $lastpage = $curpage
          for page in $pages.toArray()
            if args.curTop >= $(page).offset().top
              $curpage = $(page)
          
          # implement our own scrollSpy.
          if $curpage.attr('id') isnt $lastpage.attr('id') # and args.curTop > args.lastTop
            
            cur_page_id = $curpage.attr 'id'
            last_page_id = $lastpage.attr 'id'

            # Activate links.
            $('[href="/#'+last_page_id+'"]').parent().removeClass 'active'
            $('[href="/#'+cur_page_id+'"]').parent().addClass 'active'

            # Update the URL hash.
            setHash cur_page_id

            opts.onpage?[$curpage.attr 'id']?(opts)
            opts.offpage?[$lastpage.attr 'id']?(opts)
      
      skrollr_instance

if typeof window isnt 'undefined'
  window.skrollrPages = module.exports.skrollrPages
