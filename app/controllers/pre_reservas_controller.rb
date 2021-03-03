class PreReservasController < ApplicationController
	before_action :set_pre_reserva, only: [:edit, :update]
	
	def index
		authorize PreReserva
		session[:page_title] = "Lista da Biblioteca"
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
				format.html { redirect_to sede_campestre_path , notice: "Pré reserva cadastrada com sucesso, em breve entraremos em contato !"}
			else
				flash[:error] = @pre_reserva.errors.full_messages
				format.html { redirect_to sede_campestre_path }
				format.json { render json: @pre_reserva.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		
	end

	def destroy
		
	end

	private
	def set_pre_reserva
		@pre_reserva = PreReserva.find(params[:id])
	end
	def pre_reserva_params
		params.require(:pre_reserva).permit(:nome_completo, :casa, :data_chegada, :data_saida, :email, :celular, :possui_dependentes, :dependetes, :possui_nao_dependentes, :nao_dependetes, :possui_criancas, :criancas)
	end
end
