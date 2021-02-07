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
    $(function() {
        $('.has1').hide(); 
        $('.have1').change(function(){
            if($('.have1').val() == 'Sim') {
                $('.has1').show(); 
            } else {
                $('.has1').hide(); 
            } 
        });
        $('.has2').hide(); 
        $('.have2').change(function(){
            if($('.have2').val() == 'Sim') {
                $('.has2').show(); 
            } else {
                $('.has2').hide(); 
            } 
        });
        $('.has3').hide(); 
        $('.have3').change(function(){
            if($('.have3').val() == 'Sim') {
                $('.has3').show(); 
            } else {
                $('.has3').hide(); 
            } 
        });
    });
});