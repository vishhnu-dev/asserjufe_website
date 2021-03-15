namespace :feed do
  	desc "Feed users"

  	# rake feed:usuarios
  	task users: :environment do
		###############################################################
		########################### Usuarios ##########################
		###############################################################
		User.create( email: 'avitassibanac@gmail.com', password: 'ff269545' )
	end
end