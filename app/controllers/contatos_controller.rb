class ContatosController < ApplicationController

	def create
		@contato = Contato.new(contato_params)
		respond_to do |format|
			if  verify_recaptcha(model: @contato) and @contato.save
				format.html { redirect_to contato_path , notice: "Mensagem enviada com sucesso !"}
			else
				flash[:error] = @contato.errors.full_messages.join('</br>')
				format.html { redirect_to contato_path }
			end
		end
	end

	# Never trust parameters from the scary internet, only allow the white list through.
    def contato_params
      params.require(:contato).permit(:email, :nome, :assunto, :telefone, :mensagem )
    end	
end
