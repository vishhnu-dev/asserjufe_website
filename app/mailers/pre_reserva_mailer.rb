class PreReservaMailer < ApplicationMailer
	def envia_email(pre_reserva)
		@pre_reserva = pre_reserva
		@mail = YAML::load_file("#{Rails.root}/config/mailer.yml")
		mail(to: @mail['pre_reserva']['email'], subject: 'Novo contato em asserjufe.org')
	end
end
