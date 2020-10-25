$(document).ready(function(){
    /* scroll up animation */
    $(window).scroll(function () {
        if ($(this).scrollTop() > 70) {
            $(".ancor-up").fadeIn(1000);
        } else {
            $(".ancor-up").fadeOut(1000);
        }
    });
    $(".ancor-up").click(function () {
      $("html, body").animate({scrollTop: 0}, '1000', 'swing');
    });
});