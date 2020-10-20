class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	include Pundit

	layout :layout_by_resource

	def layout_by_resource
		if controller_name == "backend" and !user_signed_in?
			'login'
		elsif controller_name == "backend" and user_signed_in?
			'backend'
		else
			'application'
		end
	end
end
