class BackendController < ApplicationController

	before_action :authenticate_user!
	before_action :verifica_necessidade_atualizacao, only:[:dashboard]

	before_action :configure_permitted_parameters, if: :devise_controller?

	def dashboard
		@usuarios_grid = initialize_grid(User.all, per_page: 5)
		@palavra = initialize_grid(PalavraPresidente.all, per_page: 5)
		@noticia = initialize_grid(Noticia.all, per_page: 5)
		abort
	end

	protected
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :role])
			devise_parameter_sanitizer.permit(:account_update, keys: [:email, :nome_completo, :data_nascimento, :role])
		end	

		def verifica_necessidade_atualizacao
			if current_user.atualizacao_necessaria?
				msg  = 'Atualização cadastral necessária no primeiro acessso.'
				msg += '<ul>'
				msg += '<li>Preencha o formulário com seus dados.</li>'
				msg += '<li>Os campos marcados com <b>*</b> são obrigatórios.</li>'
				msg += '</ul>'
				flash[:warning] = msg
				redirect_to(atualizacao_cadastral_path)
			end
		end
end
