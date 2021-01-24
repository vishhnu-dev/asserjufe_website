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