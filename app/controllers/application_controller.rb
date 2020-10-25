 class ApplicationController < ActionController::Base
	
	protect_from_forgery with: :exception

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
end
