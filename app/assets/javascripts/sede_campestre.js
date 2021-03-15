$(document).on('turbolinks:load', function(){
    $(".owl-gallery").owlCarousel({
    	dots: false,
        center : true,
        loop : true,
        margin: 5,
        nav : false,
		autoplay: true,
        autoplayTimeout: 3000,
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

    $('.perfil').change(function() {
      if (this.value == 'associado') {
        $('.perfil_for').show();
      } else {
        $('.perfil_for').hide();
      }
    });
});