$(document).on('turbolinks:load', function(){
    
    //data-fancybox gallery
    $().fancybox({
        selector : '.owl-item:not(.cloned) a',
            hash   : false,
            thumbs : {
                autoStart : false
            },
        buttons : [
            'close'
        ]
    });

    // scroll up animation
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
    // END

    // TOLLTIP BOX
    $(function () {
      $('[data-toggle="tooltip"]').tooltip()
    })
    // END

    $('.owl-news').owlCarousel({
        dots: false,
        autoHeight: true,
        items: 1,
        loop: true,
        nav: true,
        navText:["<i class='fa fa-chevron-left' aria-hidden='true'></i>","<i class='fa fa-chevron-right' aria-hidden='true'></i>"],
        autoplay: true,
        autoplayTimeout: 4000,
        responsive: {
             // breakpoint from 0 up
            0 : {
                items: 1
            },
            // breakpoint from 480 up
            480 : {
                items: 1
            },
            // breakpoint from 768 up
            1200 : {
                items: 1
            }
        }
    });

    $('.owl-conv').owlCarousel({
        dots: false,
        autoHeight: false,
        loop: true,
        nav: false,
        margin: 5,
        autoplay: true,
        autoplayTimeout: 2000,
        responsive: {
             // breakpoint from 0 up
            0 : {
                items: 3
            },
            // breakpoint from 480 up
            480 : {
                items: 3
            },
            // breakpoint from 768 up
            1200 : {
                items: 3
            }
        }
    });

    $('.owl-banners').owlCarousel({
        dots: false,
        autoHeight: true,
        items: 1,
        loop: false,
        nav: true,
        navText:["<i class='fa fa-chevron-left' aria-hidden='true'></i>","<i class='fa fa-chevron-right' aria-hidden='true'></i>"],
        autoplay: true,
        autoplayTimeout: 4000
    });

    // MASCARA DE TELEFONE //
    var pwdbehavior = function (val) {
        return val.replace(/\D/g, '').length == 11 ? '(00) 00000-0000' : '(00) 0000-00009';
    },
    pwdptions = {
    placeholder: "(__) _____-____",
    onKeyPress: function(val, e, field, options) {
        field.mask(pwdbehavior.apply({}, arguments), options);
      }
    };
    $('.phone_with_ddd').mask(pwdbehavior, pwdptions);

    /* Menu scroll */
    $('a[href^="#"]').on('click',function (e) {
        e.preventDefault();
        var target = this.hash;
        $target = $(target);
        $('html, body').stop().animate({
            'scrollTop':  $target.offset().top - 68
        }, 900, 'swing', function () {
        });
    });
});
