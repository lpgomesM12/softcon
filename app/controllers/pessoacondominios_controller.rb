class PessoacondominiosController < ApplicationController
  before_action :set_pessoacondominio, only: [:show, :edit, :update, :destroy]

  # GET /pessoacondominios
  # GET /pessoacondominios.json
  def index
    @pessoacondominios = Pessoacondominio.where(condominio_id: current_user.condominio_id)
  end

  # GET /pessoacondominios/1
  # GET /pessoacondominios/1.json
  def show
  end

  # GET /pessoacondominios/new
  def new
    @pessoacondominio = Pessoacondominio.new
    @pessoacondominio.build_pessoa
  end

  # GET /pessoacondominios/1/edit
  def edit
  end

  # POST /pessoacondominios
  # POST /pessoacondominios.json
  def create
    @pessoacondominio = Pessoacondominio.new(pessoacondominio_params)

    respond_to do |format|
      if @pessoacondominio.save
        format.html { redirect_to @pessoacondominio, notice: 'Pessoa cadastrada com sucesso.' }
        format.json { render :show, status: :created, location: @pessoacondominio }
      else
        format.html { render :new }
        format.json { render json: @pessoacondominio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pessoacondominios/1
  # PATCH/PUT /pessoacondominios/1.json
  def update
    respond_to do |format|
      if @pessoacondominio.update(pessoacondominio_params)
        format.html { redirect_to @pessoacondominio, notice: 'Pessoa alterada com sucesso.' }
        format.json { render :show, status: :ok, location: @pessoacondominio }
      else
        format.html { render :edit }
        format.json { render json: @pessoacondominio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pessoacondominios/1
  # DELETE /pessoacondominios/1.json
  def destroy
    @pessoacondominio.destroy
    respond_to do |format|
      format.html { redirect_to pessoacondominios_url, notice: 'Pessoa deletada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoacondominio
      @pessoacondominio = Pessoacondominio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pessoacondominio_params
      params.require(:pessoacondominio).permit(:condominio_id, :pessoa_id, pessoa_attributes: [:id, :nome_pessoa, :desc_fone, :cpf, :rg, :avatar, :email_pessoa, veiculos_attributes: [:id, :desc_placa, :desc_veiculo, :condominio_id]])
    end
end
