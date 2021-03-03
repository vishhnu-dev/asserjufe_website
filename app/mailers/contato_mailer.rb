class ContatoMailer < ApplicationMailer
	def envia_email(contato)
		@contato = contato
		@mail = YAML::load_file("#{Rails.root}/config/mailer.yml")
		mail(to: @mail['contato']['email'], subject: 'Novo contato em asserjufe.org')
	end
end
