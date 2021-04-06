class User < ApplicationRecord
	enum role: [:default, :administrador]
	enum atualizacao: [:atualizacao_necessaria, :atualizacao_desnecessaria]

	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  	devise :database_authenticatable, :rememberable, :validatable
  	
  	validates :email, presence: true, uniqueness: true, :on => :create
	validates :password, presence: true, :length => { :minimum => 6 }, :on => :create
	validates :nome_completo, :data_nascimento, presence: true, :on => :update, if: :atualizacao_necessaria?

	after_commit :atualiza_status, on: :update

	def idade
    	return nil if !self.data_nascimento
	    now = Time.now.to_date
	    dob = self.data_nascimento
	    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  	end

	private
		def atualiza_status
			if self.nome_completo.present? and self.data_nascimento.present?
				self.update_column(:atualizacao, :atualizacao_desnecessaria)
			end	
		end
end