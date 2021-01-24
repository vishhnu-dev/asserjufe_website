class Contato < ApplicationRecord
	validates :email, :nome, :assunto, :mensagem, presence: { mensagem: "não pode ficar em branco" }
end
