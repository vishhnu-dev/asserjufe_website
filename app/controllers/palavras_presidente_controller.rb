class PalavrasPresidenteController < ApplicationController
	before_action :set_palavra_presidente, only: [:edit, :update, :destroy]

	def index
		authorize PalavraPresidente
    	session[:page_title] = "Palavra do presidente"

		@palavra = initialize_grid(PalavraPresidente.all, order: 'id')
	end

	def show
		redirect_to palavras_presidente_path
	end

	def new
		authorize PalavraPresidente
		session[:page_title] = " Cadastrar Palavra do presidente"
		@palavra = PalavraPresidente.new
	end

	def edit
		authorize @palavra
		session[:page_title] = "Atualizar Palavra do Presidente"
	end

	def create
		authorize PalavraPresidente
		@palavra = PalavraPresidente.new(palavra_params)
		respond_to do |format|
			if @palavra.save
				format.html { redirect_to palavras_presidente_path, notice: 'Palavra do Presidente criada com sucesso !' }
			else
				format.html { render :edit }
			end
		end
	end

	def update
		authorize @palavra
		respond_to do |format|
			if @palavra.update(palavra_params)
				format.html { redirect_to palavras_presidente_path, notice: 'Palavra do Presidente atualizada com sucesso !'}
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		authorize @palavra
		respond_to do |format|
			if @palavra.destroy
				format.html { redirect_to palavras_presidente_path, notice: 'Palavra do Presidente excluída com sucesso !'}
			else
				format.html { redirect_to palavras_presidente_path, notice: 'Palavra do Presidente não pôde ser excluída, contate o administrador do sistema !'}
			end
		end
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_palavra_presidente
			@palavra = PalavraPresidente.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def palavra_params
			params.require(:palavra_presidente).permit(:description)
		end
end
