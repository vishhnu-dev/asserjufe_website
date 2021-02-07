class NoticiasController < ApplicationController
	before_action :set_noticia, only: [:edit, :update, :destroy, :file]

	def index
		authorize Noticia
    	session[:page_title] = "Lista de Notícias"

		@noticia = initialize_grid(Noticia.all, order: 'id')	
	end

	def new
		authorize Noticia
    	session[:page_title] = "Cadastro de notícia"
    	@noticia = Noticia.new		
	end

	def show
		redirect_to noticias_path
	end

	def create
		authorize Noticia
		@noticia = Noticia.new(noticia_params)
		respond_to do |format|
			if @noticia.save
				format.html { redirect_to noticias_path }
			else
				format.html { render :edit }
			end
		end
	end

	def edit
		authorize @noticia
		session[:page_title] = "Editar notícia"
	end

	def update
		authorize @noticia
		respond_to do |format|
			if @noticia.update(noticia_params)
				format.html { redirect_to noticias_path, notice: 'Notícia atualizada com sucesso !'}
			else
				format.html { render :edit }
			end
		end
	end

	def destroy
		authorize @noticia
		respond_to do |format|
			if @noticia.destroy
				format.html { redirect_to noticias_path, notice: 'Notícia excluída com sucesso !'}
			else
				format.html { redirect_to noticias_path, notice: 'Notícia não pôde ser excluída, contate o administrador do sistema !'}
			end
		end
	end

	# get noticias/uploads/:id/:file_type
	def file
		authorize @noticia
		render partial: 'arquivo'
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_noticia
			@noticia = Noticia.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def noticia_params
			params.require(:noticia).permit(:title, :description, :imagem, :video, :doc, :slug)
		end
end
