class ContatosController < ApplicationController

	def create
		@contato = Contato.new(contato_params)
		respond_to do |format|
			if verify_recaptcha(model: @contato) and @contato.save
				format.html { redirect_to contato_path , notice: "Mensagem enviado com sucesso !"}
			else				
				format.html { redirect_to contato_path, notice: "Preencha os campos para enviar a mensagem." }
			end
		end
	end

	# Never trust parameters from the scary internet, only allow the white list through.
    def contato_params
      params.require(:contato).permit(:email, :nome, :assunto, :telefone, :mensagem )
    end	
end
