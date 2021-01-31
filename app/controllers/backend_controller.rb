class BackendController < ApplicationController

	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

	def user_not_authorized
		flash[:error] = 'Você não tem permissão para realizar esta ação'
		redirect_to dashboard_path
	end

	def dashboard
		@usuarios_grid = initialize_grid(User.all, per_page: 5)
		@palavra = initialize_grid(PalavraPresidente.all, per_page: 5)
		@noticia = initialize_grid(Noticia.all, per_page: 5)
	end

	protected
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :role])
			devise_parameter_sanitizer.permit(:account_update, keys: [:email, :role])
		end	
end
