class Assinatura < ApplicationRecord
	validates :nome, :sexo, :data_nascimento, :nome_mae, :nome_pai, :celular, :email, presence: true

	enum sexo: [:masculino, :feminino]

	after_create :envia_email

	def envia_email
		AssinaturaMailer.envia_email(self).deliver_now
	end
end
