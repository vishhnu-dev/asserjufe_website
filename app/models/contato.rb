class Contato < ApplicationRecord
	validates :email, :nome, :assunto, :telefone, :mensagem, presence: { mensagem: "não pode ficar em branco" }

	after_create :envia_email

	def envia_email
		ContatoMailer.envia_email(self).deliver_now
	end
end
