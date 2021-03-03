class PreReserva < ApplicationRecord
	validates :nome_completo, :casa, :data_chegada, :data_saida, :email, :celular, :presence => true
	# validates :dependetes
	# validates :nao_dependetes
	# validates :criancas

	def has_dependetes
		self.possui_dependentes == "sim"
	end
end
