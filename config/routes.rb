Rails.application.routes.draw do
  devise_for :users , path_names: { sign_in: :entrar, sign_out: :sair }
  root 'asserjufe#home'

  get 'entrar' => 'backend#dashboard', :as => 'dashboard'
  
end
