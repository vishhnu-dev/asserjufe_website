class PreReserva < ApplicationRecord
		
	enum tipo_cliente: [:visitante, :associado]

	validates :nome_completo, :casa, :data_chegada, :data_saida, :email, :celular, :tipo_cliente, :numero_criancas, :presence => true
	validates :numero_dependentes, presence: true, if: -> { self.tipo_cliente == 1 }
	validates :numero_acompanhantes, presence: true, if: -> { self.tipo_cliente == 0 }
	

	after_create :envia_email

	def has_dependetes
		self.possui_dependentes == "sim"
	end

	def envia_email
		PreReservaMailer.envia_email(self).deliver_later
	end
end
