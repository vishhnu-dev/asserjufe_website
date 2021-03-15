class AsserjufeController < ApplicationController
  before_action :set_noticia, only: [:noticia]
  before_action :docs

  def home
  	@page_title = "Página Inicial"
    @noticias = Noticia.all.order(created_at: :asc).limit(6)
    @palavras = PalavraPresidente.all
    @banners = Banner.where(status: :ativo)
  end
  
  def a_asserjufe
  	@page_title = "A Asserjufe"
  end

  def diretoria
  	@page_title = "Diretoria"
  end

  def sede_campestre
  	@page_title = "Sede campestre"
    @pre_reserva = PreReserva.new
  end

  def associe_se
  	@page_title = "Associe-se"
    @assinatura = Assinatura.new
  end

  def convenios
  	@page_title = "Convênios"
  end

  def contato
  	@page_title = "Contato"
    @contato = Contato.new
  end

  def noticia
    # current noticia
    @page_title = @noticia.title

    #todas noticias
    @noticias = Noticia.where.not(slug: @noticia.slug)
  end

  private
    def set_noticia
      @noticia = Noticia.find_by(slug: params[:slug])
    end

    def docs
      @documentos = Documento.all
    end

    def visualizar_doc
      render 'arquivo'
    end
end
