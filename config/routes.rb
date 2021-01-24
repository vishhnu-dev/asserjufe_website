Rails.application.routes.draw do
	root 'asserjufe#home'

	get 'a-asserjufe' => 'asserjufe#a_asserjufe', as: :a_asserjufe
	get 'sede-campestre' => 'asserjufe#sede_campestre', as: :sede_campestre
	get 'associe-se' => 'asserjufe#associe_se', as: :associe_se
	get 'convenios' => 'asserjufe#convenios', as: :convenios
	get 'contato' => 'asserjufe#contato', as: :contato
	get 'noticia/:title' => 'asserjufe#noticia', as: :noticia_visualizar

	# backend
	get 'administracao' => 'backend#dashboard', :as => 'backend'

	resources :noticias, path: 'noticias', path_names: { new: 'cadastrar', edit: 'atualizar'}
	resources :palavras_presidente, path: 'palavra-do-presidente', path_names: { new: 'cadastrar', edit: 'atualizar'}
	resources :contatos

	get 'noticias/uploads/:id/:filetype' => 'noticias#file', :as => 'noticia_file'

	# Usuarios # has to stand before devise routes
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

	# has to stand after Devise routes
	delete 'usuarios/:id'        => 'controle_usuarios#destroy', as: :destroy_usuario

end
