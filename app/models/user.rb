class User < ApplicationRecord
	enum role: [:apenas_leitura, :administrador]
	enum atualizacao: [:atualizacao_necessaria, :atualizacao_desnecessaria]

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :rememberable, :validatable
  	
	validates :email, presence: true, uniqueness: true, :on => :create
	validates :password, presence: true, :length => { :minimum => 6 }, :on => :create
	validates :nome_completo, :data_nascimento, presence: true, :on => :update, if: :atualizacao_necessaria?
	validates :password, :password_confirmation, presence: true, on: :update

	def idade
    	return nil if !self.data_nascimento
	    now = Time.now.to_date
	    dob = self.data_nascimento
	    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  	end
end