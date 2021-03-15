module ApplicationHelper
	def label_status text, color
		content_tag(:small, text.upcase, class: "label bg-#{color}")
	end

	def options_for_tipo_cliente
    	PreReserva.tipo_clientes.keys.map{ |key| [ (key.humanize.titlecase) , key] }
    end

    def options_for_sexo
    	Assinatura.sexos.keys.map{ |key| [ (key.humanize.titlecase) , key] }
    end

    def tipo_client_grid
    	{"Visitante" => 0, "Associado" => 1}
    end
end
