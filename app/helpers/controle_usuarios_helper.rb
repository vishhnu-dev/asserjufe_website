module ControleUsuariosHelper
	def options_for_role
		{ "Associado" => 0, "Funcionario" => 1, "Administrador" => 2}
	end
	def options_for_select_role
		User.roles.map { |key, value| [key.humanize, key] }
	end
end
