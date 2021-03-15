class AssinaturaMailer < ApplicationMailer
	def envia_email(assinatura)
		@assinatura = assinatura
		@mail = YAML::load_file("#{Rails.root}/config/mailer.yml")
		mail(to: @mail['assinatura']['email'], subject: 'Nova proposta de sócio recebida')
	end
end
