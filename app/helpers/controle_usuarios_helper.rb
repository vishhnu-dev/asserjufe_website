module ControleUsuariosHelper
	def options_for_role
		{ "Nenhuma" => 0, "Administrador" => 1 }
	end
	def options_for_select_role
		User.roles.map { |key, value| [key.humanize, key] }
	end
end
