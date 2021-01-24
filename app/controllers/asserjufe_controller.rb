class AsserjufeController < ApplicationController
  before_action :set_noticia, only: [:noticia]

  def home
  	@page_title = "Página Inicial"
    @noticias = Noticia.all
    @palavras = PalavraPresidente.all
  end
  
  def a_asserjufe
  	@page_title = "A Asserjufe"
  end

  def diretoria
  	@page_title = "Diretoria"
  end

  def sede_campestre
  	@page_title = "Sede campestre"
  end

  def associe_se
  	@page_title = "Associe-se"
  end

  def convenios
  	@page_title = "Convênios"
  end

  def contato
  	@page_title = "Contato"
    @contato = Contato.new
  end

  def noticia
    @page_title = @noticia.title
    @noticias = Noticia.where.not(id: @noticia.id)
  end

  private
    def set_noticia
      @noticia = Noticia.find_by(title: params[:title])
    end
end
