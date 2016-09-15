class IdentificacaosController < ApplicationController
  before_action :set_identificacao, only: [:show, :edit, :update, :destroy]

  # GET /identificacaos
  # GET /identificacaos.json
  def index
    @identificacaos = Identificacao.all
  end

  # GET /identificacaos/1
  # GET /identificacaos/1.json
  def show
  end

  # GET /identificacaos/new
  def new
    @identificacao = Identificacao.new
  end

  # GET /identificacaos/1/edit
  def edit
  end

  # POST /identificacaos
  # POST /identificacaos.json
  def create
    @identificacao = Identificacao.new(identificacao_params)

    respond_to do |format|
      if @identificacao.save
        format.html { redirect_to @identificacao, notice: 'Identificacao was successfully created.' }
        format.json { render :show, status: :created, location: @identificacao }
      else
        format.html { render :new }
        format.json { render json: @identificacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /identificacaos/1
  # PATCH/PUT /identificacaos/1.json
  def update
    respond_to do |format|
      if @identificacao.update(identificacao_params)
        format.html { redirect_to @identificacao, notice: 'Identificacao was successfully updated.' }
        format.json { render :show, status: :ok, location: @identificacao }
      else
        format.html { render :edit }
        format.json { render json: @identificacao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /identificacaos/1
  # DELETE /identificacaos/1.json
  def destroy
    @identificacao.destroy
    respond_to do |format|
      format.html { redirect_to identificacaos_url, notice: 'Identificacao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_identificacao
      @identificacao = Identificacao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def identificacao_params
      params.require(:identificacao).permit(:desc_identificador, :desc_nome, :desc_fone, :desc_atividade, :apartamento_id, :avatar, :condominio_id)
    end
end
