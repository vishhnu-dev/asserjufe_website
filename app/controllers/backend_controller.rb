class BackendController < ApplicationController

	protect_from_forgery with: :exception

	include Pundit
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	before_action :authenticate_user!

	before_action :configure_permitted_parameters, if: :devise_controller?

	def user_not_authorized
		flash[:error] = 'Você não tem permissão para realizar esta ação'
		redirect_to(backend_path)
	end

	protected
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :nome_completo, :data_nascimento, :password, :role])
			devise_parameter_sanitizer.permit(:account_update, keys: [:email,  :role])
		end	
end
