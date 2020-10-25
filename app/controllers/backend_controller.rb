class BackendController < ApplicationController

	include Pundit
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

	def user_not_authorized
		flash[:error] = 'Você não tem permissão para realizar esta ação' #adicionar partial error
		redirect_to(root_path)
	end

	def dashboard
		session[:page_title] = "Dashboard"
	end

	protected
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :password, :role])
			devise_parameter_sanitizer.permit(:account_update, keys: [:email, :role])
		end	
end
