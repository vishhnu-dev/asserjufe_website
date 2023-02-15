module BannersHelper
	def options_for_status
		['Ativo' => 1, 'Inativo' => 0]
	end

	def options_for_url
		{ 'Sobre a Asserjufe' => '/a-asserjufe', 'Sede Campestre' => '/sede-campestre', 'Associe-se' => '/associe-se', 'Convênios' => '/convenios', 'Contato' => '/contato' }
	end
end
