$(document).scroll(function () {
    var $nav_inner = $(".navbar-inner");
    var $nav = $(".nav")
    var $image = $("#company-logo");
    $nav_inner.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
    $nav.toggleClass('scrolled', $(this).scrollTop() > $nav.height());
    // if($(this).scrollTop() > $nav.height()){
    //     $image.attr('src', '/images/countable-logo.png');
    // }else{
    //     $image.attr('src', '/images/countable-logo_white.png');
    // }
});

$(function(){
    var stickyHeaderTop = $('.rocketship').offset().top - 300;
    $(window).scroll(function(){
            if( $(window).scrollTop()> stickyHeaderTop ) {
                $('.rocketship').css({position: 'fixed', top: '300px'});
                $('#sticky').css('display', 'inline-block');
            } else {
                $('.rocketship').css({position: 'absolute', 'top': '1360px'});
                $('#sticky').css('display', 'none');
            }
            if ($(window).scrollTop()> 1500){
                $('.rocketship').css({position: 'absolute', 'top': '1800px'});
                $('#sticky').css('display', 'none');
            }
    });
});
