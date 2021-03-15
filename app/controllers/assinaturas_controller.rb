class AssinaturasController < ApplicationController
	before_action :set_assinatura2, only: [:edit, :update, :destroy]
	
	def index
		authorize AssinaturaController
		session[:page_title] = "Lista de Pré reservas"
		@pre_reserva_grid = initialize_grid(Assinatura.all, per_page: 5)
	end


	def create
		@assinatura = Assinatura.new(assinatura_params)
		respond_to do |format|
			if  verify_recaptcha(model: @assinatura) and @assinatura.save
				flash[:success] = "Pronto ! Em breve entraremos em contato com nossa proposta"
				format.html { redirect_to associe_se_path }
			else
				flash[:error] = @assinatura.errors.full_messages.join('</br>')
				format.html { redirect_to associe_se_path }
			end
		end
	end

	def update
		
	end

	def destroy
		authorize @assinatura
		respond_to do |format|
			if @assinatura.destroy
				format.html { redirect_to pre_reservas_path, notice: 'Proposta de asscociação exclída com sucesso!'}
			else
				format.html { redirect_to pre_reservas_path, notice: 'Proposta de asscociação não pôde ser exclída!'}
			end
		end
	end

	private
	def set_pre_reserva
		@assinatura = PreReserva.find(params[:id])
	end
	def assinatura_params
		params.require(:assinatura).permit(:nome, :sexo, :data_nascimento, :nome_pai, :nome_mae, :celular, :celular2, :email)
	end
end
