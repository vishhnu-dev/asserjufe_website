class PreReservasController < ApplicationController
	before_action :set_pre_reserva, only: [:edit, :update, :destroy]
	
	def index
		authorize PreReserva
		session[:page_title] = "Lista de Pré reservas"
		@pre_reserva_grid = initialize_grid(PreReserva.all, per_page: 5)
	end

	def new

	end

	def edit
		
	end

	def create
		@pre_reserva = PreReserva.new(pre_reserva_params)
		respond_to do |format|
			if  verify_recaptcha(model: @pre_reserva) and @pre_reserva.save
				flash[:success] = "Pré reserva cadastrada com sucesso, em breve entraremos em contato !"
				format.html { redirect_to sede_campestre_path }
			else
				flash[:error] = @pre_reserva.errors.full_messages.join('</br>')
				format.html { redirect_to sede_campestre_path }
			end
		end
	end

	def update
		
	end

	def destroy
		authorize @pre_reserva
		respond_to do |format|
			if @pre_reserva.destroy
				format.html { redirect_to pre_reservas_path, notice: 'Pré reserva exclída com sucesso!'}
			else
				format.html { redirect_to pre_reservas_path, notice: 'Pré reserva não pôde ser exclída!'}
			end
		end
	end

	private
	def set_pre_reserva
		@pre_reserva = PreReserva.find(params[:id])
	end
	def pre_reserva_params
		params.require(:pre_reserva).permit(:nome_completo, :casa, :data_chegada, :data_saida, :email, :celular, :tipo_cliente, :numero_acompanhantes, :numero_criancas, :numero_dependentes)
	end
end
