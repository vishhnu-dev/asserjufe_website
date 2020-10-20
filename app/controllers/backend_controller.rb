class BackendController < ApplicationController
	# before_action :authenticate_user!

	def dashboard
		@page_title = "Dashboard"
	end
end
