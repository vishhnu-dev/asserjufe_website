Rails.application.routes.draw do
	root 'asserjufe#home'

	get 'a-asserjufe' => 'asserjufe#a_asserjufe', as: :a_asserjufe
	get 'diretoria' => 'asserjufe#diretoria', as: :diretoria
	get 'sede-campestre' => 'asserjufe#sede_campestre', as: :sede_campestre
	get 'associe-se' => 'asserjufe#associe_se', as: :associe_se
	get 'convenios' => 'asserjufe#convenios', as: :convenios
	get 'contato' => 'asserjufe#contato', as: :contato

	# backend
	get 'administracao' => 'backend#dashboard', :as => 'backend'

  	devise_for :users , path_names: { sign_in: :entrar, sign_out: :sair }
	as :usuario do
	  	get 'usuarios/alterar-senha' => 'usuarios/registrations#edit',   :as => 'edit_usuario_registration'
		put 'usuarios/alterar-senha' => 'usuarios/registrations#update', :as => 'update_usuario_registration'            
	end
end
