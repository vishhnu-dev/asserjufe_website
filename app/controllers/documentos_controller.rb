class DocumentosController < ApplicationController
	before_action :set_documento, only: [:edit, :update, :destroy, :file]
	
	def index
		authorize Documento
		session[:page_title] = "Lista da Biblioteca"
		@documentos_grid = initialize_grid(Documento.all, per_page: 5)
	end

	def new
		authorize Documento
		session[:page_title] = "Cadastrar Documentos"
		@documentos = Documento.new

	end

	def edit
		authorize @documentos
		session[:page_title] = "Editar Documentos"
	end

	def create
		authorize Documento
		@documentos = Documento.new(documento_params)
		respond_to do |format|
			if @documentos.save
				format.html { redirect_to documentos_path }
			else
				format.html { render :edit }
			end
		end
	end

	def update
		authorize @documentos
		respond_to do |format|
			if @documentos.update(documento_params)
				format.html { redirect_to documentos_path, notice: "Documentos atualizados com sucesso!" }
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		authorize @documentos
		respond_to do |format|
			if @documentos.destroy
				format.html { redirect_to documentos_path }
			else
				format.html { redirect_to documentos_path }
			end
		end
	end

	# get documetos/uploads/:id/:file
	def file
		authorize @documentos
		render partial: 'arquivo'
	end

	private
		def set_documento
			@documentos = Documento.find(params[:id])
		end
		def documento_params
			params.require(:documento).permit(:estatuto, :tabela_valores, :regimento_interno, :regulamento)
		end
end