namespace :feed do
  	desc "Feed users"

  	# rake feed:usuarios
  	task users: :environment do
		###############################################################
		########################### Usuarios ##########################
		###############################################################
		User.create( email: 'avitassibanac@gmail.com', password: 'asserjuferspoa' )
		User.create( email: 'jorgegpimentel@gmail.com', password: 'asserjuferspoa' )
		User.create( email: 'asserjufe.poa@gmail.com', password: 'asserjuferspoa' )
	end
end