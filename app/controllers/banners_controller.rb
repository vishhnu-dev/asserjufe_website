class BannersController < ApplicationController
  before_action :set_banner, only: [:show, :edit, :update, :destroy, :visualizar]

  def index
    authorize Banner
    session[:page_title] = "Banners"
    @banners_grid = initialize_grid(Banner.all)
  end

  def new
    authorize Banner
    session[:page_title] = "Cadastrar banner"
    @banner = Banner.new
  end

  def edit
    authorize @banner
    session[:page_title] = "Editar banner"
  end

  def create
    authorize Banner
    @banner = Banner.new(banner_params)

    respond_to do |format|
      if @banner.save
        format.html { redirect_to banners_path, notice: 'Banner criado com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @banner.update(banner_params)
        format.html { redirect_to banners_path, notice: 'Banner atualizado com sucesso' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @banner.destroy
    respond_to do |format|
      format.html { redirect_to banners_path, notice: 'Banner excluído com sucesso' }
    end
  end

  def visualizar
    authorize @banner
    @campo = params[:campo] if params[:campo].present?
    render partial: 'arquivo'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banner
      @banner = Banner.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def banner_params
      params.require(:banner).permit(:status, :imagem, :imagem_mobile, :url)
    end
end
