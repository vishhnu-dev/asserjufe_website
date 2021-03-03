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
		false
	end

	def create?
		false
	end

	def update?
		user.administrador? or (user.id == record.id)
	end

	def destroy?
		user.administrador? and (user.id != record.id)
	end

	class Scope < Scope
		def resolve
		  scope.all
		end
	end
end
