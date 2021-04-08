$(document).on('turbolinks:load', function(){
	
	$('.btn-file').click(function(){
		let id = this.dataset.id;
		let filetype = this.dataset.filetype;

		$.ajax({
			url: 'noticias/uploads/'+id+'/'+filetype,
			method: 'GET',
			success: function(data){
				$('#noticias .modal-title').html('Pré-visualização de '+filetype);
				$('#noticias').modal('hide');
				$('#noticias .modal-body').html(data);
				$('#noticias').modal('show');
			}
		});
	});
});
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/de_DE/sdk.js#xfbml=1&version=v2.9";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

document.addEventListener("turbolinks:load", function() {
  if(window.FB) {
    FB.XFBML.parse();
  }
});