 class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	before_action :set_current_page_url
	before_action :set_url_ambiente

	include Pundit

	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	layout :layout_by_resource

	private
		def layout_by_resource
			if !user_signed_in? and controller_name != 'asserjufe'
				'login'
			elsif user_signed_in? and controller_name != 'asserjufe'
				'dashboard'
			else
				'application'
			end
		end

		def set_current_page_url
			@current_url = request.original_url
		end

		def set_url_ambiente
			if Rails.env.production?
				@url = "http://asserjufers.vps-kinghost.net/"
			else
				@url = "http://localhost:3000"
			end
		end

		def after_sign_out_path_for(resource)
		  stored_location_for(resource) || backend_path
		end
		
		def user_not_authorized
			flash[:error] = 'Você não tem permissão para realizar esta ação'
			redirect_to backend_path
		end
end
