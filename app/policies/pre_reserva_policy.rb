class PreReservaPolicy < ApplicationPolicy
	def index?
		user.administrador?
	end

	def new?
		false
	end

	def edit?
		user.administrador?
	end

	def show?
		user.administrador?
	end

	def create?
		false
	end

	def update?
		user.administrador?
	end

	def destroy?
		user.administrador?
	end

	class Scope < Scope
		def resolve
		  scope.all
		end
	end
end
