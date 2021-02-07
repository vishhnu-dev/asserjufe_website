class PalavraPresidente < ApplicationRecord
	validates :description, presence: { message: "não pode ficar em branco." }
	
	after_create :exclui_palavra_anterior

	def exclui_palavra_anterior
		@reg = PalavraPresidente.all
		PalavraPresidente.first.destroy if @reg.count >= 2
	end
end
