class User < ApplicationRecord
	enum role: [:associado, :funcionario_efetivo, :funcionario_cooperador, :administrador, :estagiario]
	enum atualizacao: [:atualizacao_necessaria, :atualizacao_desnecessaria]

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :rememberable, :validatable
  	
  	validates :email, presence: true, uniqueness: true, :on => :create
	validates :password, presence: true, :length => { :minimum => 6 }, :on => :create
end