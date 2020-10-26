class AsserjufeController < ApplicationController
  def home
  	@page_title = "Página Inicial"
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
end
