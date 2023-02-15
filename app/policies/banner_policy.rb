class BannerPolicy < ApplicationPolicy
  	def index?
		user.administrador? or user.apenas_leitura?
	end

	def new?
		user.administrador?
	end

	def edit?
		user.administrador?
	end

	def show?
		user.administrador?
	end

	def create?
		new?
	end

	def update?
		edit?
	end

	def destroy?
		user.administrador?
	end

	def visualizar?
		user.administrador?
	end

	class Scope < Scope
		def resolve
		  scope.all
		end
	end
end
