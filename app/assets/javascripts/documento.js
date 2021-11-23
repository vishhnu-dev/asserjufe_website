$(document).on('turbolinks:load', function(){

	$('.btn-doc').click(function(){
		let id = this.dataset.id;
		let file = this.dataset.file;

		$.ajax({
			url: 'documentos/uploads/'+id+'/'+file,
			method: 'GET',
			success: function(data){
				$('#documentos .modal-title').html('Pré-visualização de '+file);
				$('#documentos').modal('hide');
				$('#documentos .modal-body').html(data);
				$('#documentos').modal('show');
			}
		});
	});

	$('.btn-banner').click(function(){
		let id = this.dataset.id;
		let campo = this.dataset.campo;
		$.ajax({
			url: 'banners/uploads/'+id+'/'+campo,
			method: 'GET',
			success: function(data){
				$('#banners .modal-title').html('Pré-visualização do banner');
				$('#banners').modal('hide');
				$('#banners .modal-body').html(data);
				$('#banners').modal('show');
			}
		});
	});

	$('.btn-doc-header').click(function(){
		let id = this.dataset.count;
		let file = this.dataset.file;
		let title = this.dataset.title

		$.ajax({
			// url: 'documentos/uploads/'+id+'/'+file,
			url: 'biblioteca/docs/'+id+'/'+file,
			method: 'GET',
			success: function(data){
				$('#docs .modal-title').html('Pré-visualização de '+file);
				$('#docs').modal('hide');
				$('#docs .modal-body').html(data);
				$('#docs').modal('show');
			}
		});
	});

});