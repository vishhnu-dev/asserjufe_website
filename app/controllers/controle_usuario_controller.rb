class ControleUsuarioController < ApplicationController
	before_action :set_usuario, only: [:edit, :update, :destroy]

	# Get /usuarios
	def index
		#authorize Usuario
    	session[:page_title] = ""
		#@usuarios_grid = initialize_grid(Usuario.all, order: 'id')
	end

	# GET /usuarios/:id/editar
	def edit
		#authorize Usuario
		session[:page_title] = ""
	end

	# GET /usuarios/novo
	def new
		#authorize Usuario
	    session[:page_title] = ""
	    @usuario = Usuario.new
	end

	# POST /usuarios
	def create
		#authorize Usuario
	    @usuario = Usuario.new(usuario_params)
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
		#authorize @usuario
		respond_to do |format|
			if @usuario.update(usuario_params)
				format.html { redirect_to edit_usuario_path(@usuario), notice: 'Usuário atualizado com sucesso!'}
			end
		end
	end

	# DELETE /usuarios/1
	def destroy
		#authorize @usuario
		respond_to do |format|
			if @usuario.destroy
				format.html { redirect_to usuarios_path, notice: 'Usuário atualizado com sucesso!'}
			else
				format.html { redirect_to usuarios_path, notice: 'Usuário não pôde ser atualizado!'}
			end
		end
	end

	private	
		# Use callbacks to share common setup or constraints between actions.
		def set_usuario
			@usuario = Usuario.find(params[:id])
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def usuario_params
			params.require(:usuario).permit(:email, :password, :mestre, :creditos)
		end

		# Verifica email em uso
		def verifica_email_em_uso
			@exist = Usuario.find_by(' email = ? ', usuario_params[:email])
		end
end
