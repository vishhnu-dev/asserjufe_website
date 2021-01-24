class UserPolicy < ApplicationPolicy
	def index?
		user.administrador?
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
