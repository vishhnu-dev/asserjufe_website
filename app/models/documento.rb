class Documento < ApplicationRecord
	mount_uploader :estatuto, DocumentosUploader
	mount_uploader :tabela_valores, DocumentosUploader
	mount_uploader :regimento_interno, DocumentosUploader
	mount_uploader :regulamento, DocumentosUploader

	after_create :exclui_documento

	def exclui_documento
		@doc = Documento.all
		Documento.first.destroy if @doc.count >= 2
	end
end
