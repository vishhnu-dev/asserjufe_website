Rails.application.routes.draw do
	root 'asserjufe#home'

	get 'a-asserjufe' => 'asserjufe#a_asserjufe', as: :a_asserjufe
	get 'diretoria' => 'asserjufe#diretoria', as: :diretoria
	get 'sede-campestre' => 'asserjufe#sede_campestre', as: :sede_campestre
	get 'associe-se' => 'asserjufe#associe_se', as: :associe_se
	get 'convenios' => 'asserjufe#convenios', as: :convenios
	get 'contato' => 'asserjufe#contato', as: :contato

	resources :contatos
	
	# backend
	get 'administracao' => 'backend#dashboard', :as => 'backend'
	get 'imagens-da-sede' => 'backend#cadastro_imagens_sede', as: :sede_image
	get 'pre-reservas' => 'backend#pre_reserva', as: :pre_reserva
	get 'email-contato' => 'backend#email_contato', as: :email_contato

	# Usuarios # has to stand before devise_for routes
	get    'usuarios'            => 'controle_usuarios#index'
	get    'usuarios/novo'       => 'controle_usuarios#new',  as: :new_usuario
	get	   'usuarios/:id/editar' => 'controle_usuarios#edit',  as: :edit_usuario
	post   'usuarios'            => 'controle_usuarios#create'
	patch  'usuarios/:id'        => 'controle_usuarios#update'

	# Devise routes
  	devise_for :users , path_names: { sign_in: :entrar, sign_out: :sair }
	as :user do
	  	get 'usuarios/alterar-senha' => 'usuarios/registrations#edit',   :as => 'edit_usuario_registration'
		put 'usuarios/alterar-senha' => 'usuarios/registrations#update', :as => 'update_usuario_registration'            
	end

	# has to stand after devise_for routes
	delete 'usuarios/:id'        => 'controle_usuarios#destroy', as: :destroy_usuario

end
