$(document).on('turbolinks:load', function(){
    
    //data-fancybox gallery
    $('[data-fancybox="gallery"]').fancybox({
        buttons : ['close', 'thumbs', 'slideShow'],
        thumbs : {
            autoStart : true
        },
        hash : false,
        share : {
            url : function( instance, item ) {
                if (item.type === 'inline' && item.contentType === 'video') {
                    return item.$content.find('source:first').attr('src');
                }
                return item.src;
            }
        }
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
    $('.owl-multiple-news').owlCarousel({
        dots: false,
        loop: false,
        nav: false,
        autoplay: true,
        margin: 35,
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
                items: 3
            }
        }
    });

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

    $('.owl-feedback').owlCarousel({
        dots: false,
        autoHeight: true,
        loop: true,
        nav: false,
        margin: 5,
        autoplay: true,
        autoplayTimeout: 2000,
        responsive: {
             // breakpoint from 0 up
            0 : {
                items: 1
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
        // base config
        autoplay: true,
        autoplayTimeout: 6000,
        dots: false,
        items:1,
        loop: true,
        // nav
        nav: true,
        navText:["<i class='fa fa-chevron-left' aria-hidden='true'></i>","<i class='fa fa-chevron-right' aria-hidden='true'></i>"]
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

    // datetime
    $('.date_time').mask('00/00/0000',{placeholder:"__/__/____"});
    $('body').on('focus', '.date_time', function() {
        $('.date_time').datetimepicker({
            calendarWeeks: true,
            format: 'DD/MM/YYYY',
            icons: {
                time: "fa fa-clock-o",
                date: "fa fa-calendar",
                up: "fa fa-arrow-up",
                down: "fa fa-arrow-down",
                next: "fa fa-arrow-right",
                previous: "fa fa-arrow-left",
                clear: 'fa fa-refresh',
                close: 'fa fa-close'
            }
        });
    });

    $('.phone_with_ddd').mask(pwdbehavior, pwdptions);

    /* phone */
    var pwdbehavior = function (val) {
        return val.replace(/\D/g, '').length == 11 ? '(00) 00000-0000' : '(00) 0000-00009';
    },
    pwdptions = {
    placeholder: "(__) _____-____",
    onKeyPress: function(val, e, field, options) {
        field.mask(pwdbehavior.apply({}, arguments), options);
      }
    };
    /* end phone*/

    // Text area
    $('.wysihtml5').each(function(i, elem) {
      $(elem).wysihtml5({
        locale: "pt-BR",
        toolbar:
        {
          "font-styles": true,
          "emphasis": true,
          "lists": false,
          "html": false,
          "link": true,
          "image": false,
          "color": true,
          "blockquote": false,
          parser: function(html) {
              return html.text();
          }
        }
      });
    });
});

// If using Turbolinks with gem 'bootstrap-wysihtml5-rails'
$(document).on('page:load', function(){
  window['rangy'].initialized = false
});