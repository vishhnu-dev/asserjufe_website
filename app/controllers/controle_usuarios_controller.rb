class ControleUsuariosController < ApplicationController
	before_action :set_usuario, only: [:edit, :update, :destroy]
	before_action :set_current_user, only: [:atualizacao_cadastral]

	# Get /usuarios
	def index
		authorize User
    	session[:page_title] = "Lista de Usuários"
		@usuarios_grid = initialize_grid(User.all, order: 'id')
	end

	def show
		redirect_to users_path
	end

	# GET /usuarios/:id/editar
	def edit
		authorize @usuario
		session[:page_title] = "Editar Usuário"
		if @usuario.atualizacao_necessaria?
			redirect_to atualizacao_cadastral_path
		end
	end

	# GET /usuarios/novo
	def new
		authorize User
	    session[:page_title] = "Cadastrar Usuário"
	    @usuario = User.new
	end

	# POST /usuarios
	def create
		authorize User
	    @usuario = User.new(usuario_params)
	    if usuario_params[:email].present? and usuario_params[:password].present?
	    	verifica_email_em_uso
	    	if !@exist
			    respond_to do |format|
					if @usuario.save
		         		format.html { redirect_to usuarios_path, notice: 'Usuário criado com sucesso!' }
					else
						flash[:error] = 'Usuário não pôde ser cadastrado, tente novamente preenchendo pelo menos email e senha!'
						redirect_to new_usuario_path 
					end
				end
			else
				flash[:error] = "O email #{usuario_params[:email]} já está em uso, por favor insira outro email!"
				redirect_to new_usuario_path 
			end
		else
			flash[:error] = 'Os campos email e senha são obrigatórios!'
			redirect_to new_usuario_path
		end
	end

	# PATCH/PUT /usuarios
	def update
		authorize @usuario
		respond_to do |format|
			if @usuario.update(usuario_params)
				format.html { redirect_to usuarios_path, notice: 'Usuário atualizado com sucesso!'}
			else
				if @usuario.atualizacao_necessaria?
					format.html { redirect_to atualizacao_cadastral_path }
				else
					format.html { render :edit}
				end
			end
		end
	end

	# DELETE /usuarios/1
	def destroy
		authorize @usuario
		respond_to do |format|
			if @usuario.destroy
				format.html { redirect_to usuarios_path, notice: 'Usuário exclído com sucesso!'}
			else
				format.html { redirect_to usuarios_path, notice: 'Usuário não pôde ser excluído!'}
			end
		end
	end

	def atualizacao_cadastral
		authorize @usuario
		session[:page_title] = "Atualização Cadastral"
	end

	private	
		# Use callbacks to share common setup or constraints between actions.
		def set_usuario
			@usuario = User.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def usuario_params
			params.require(:user).permit(:email, :nome_completo, :data_nascimento, :password, :role)
		end

		# Verifica email em uso
		def verifica_email_em_uso
			@exist = User.find_by(' email = ? ', usuario_params[:email])
		end

		def set_current_user
			@usuario = User.find(current_user.id)
		end
end
