$(document).scroll(function () {
    var $nav_inner = $(".navbar-inner");
    var $nav = $(".nav")
    var $image = $("#company-logo");
    $nav_inner.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
    $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
    if($(this).scrollTop() > $nav.height()){
        $image.attr('src', '/images/countable-logo.png');
    }else{
        $image.attr('src', '/images/countable-logo_white.png');
    }
});

