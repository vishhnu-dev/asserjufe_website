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

	$('.btn-doc-header').click(function(){
		let id = this.dataset.count;
		let file = this.dataset.file;
		let title = this.dataset.title

		$.ajax({
			url: 'documentos/uploads/'+id+'/'+file,
			method: 'GET',
			success: function(data){
				$('#docs .modal-title').html(title);
				$('#docs').modal('hide');
				$('#docs .modal-body').html(data);
				$('#docs').modal('show');
			}
		});
	});

});