 class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :set_current_page_url
	before_action :set_url_ambiente
	
	include Pundit
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

	layout :layout_by_resource

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
			@url = "http://grupomaaf.com.br"
		else
			@url = "http://localhost:3000"
		end
	end
end
