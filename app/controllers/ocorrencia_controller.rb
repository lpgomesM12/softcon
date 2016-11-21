class OcorrenciaController < ApplicationController
  before_action :set_ocorrencium, only: [:show, :edit, :update, :destroy]


  def baixa_ocorrencia
    @ocorrencium = Ocorrencium.find(params[:id])
    @ocorrencium.data_saida = Time.now
    @ocorrencium.save

    redirect_to ocorrencia_path
  end

  def busca_identificacao
    identificacao = Identificacao.where(desc_identificador: params[:identificador])
    identificacao_json = identificacao.map {|item| {:id => item.id,
                                                    :desc_nome => item.desc_nome,
                                                    :desc_fone => item.desc_fone,
                                                    :desc_atividade => item.desc_atividade}}
    render :json => identificacao_json
  end

  # GET /ocorrencia
  # GET /ocorrencia.json
  def index
    @ocorrencia = Ocorrencium.where(data_saida: nil, condominio_id: current_user.condominio_id)
  end

  # GET /ocorrencia/1
  # GET /ocorrencia/1.json
  def show
  end

  # GET /ocorrencia/new
  def new
    @ocorrencium = Ocorrencium.new
    @ocorrencium.build_identificacao
  end

  # GET /ocorrencia/1/edit
  def edit
  end

  # POST /ocorrencia
  # POST /ocorrencia.json
  def create
    if  params[:id_identificacao] != ""
          @ocorrencium = Ocorrencium.new(ocorren_params)
          @ocorrencium.identificacao_id = params[:id_identificacao]
          @identificacao = Identificacao.find(params[:id_identificacao])
          @identificacao.desc_atividade = @ocorrencium.desc_ocorrencia
          @identificacao.desc_nome = ocorrencium_params[:identificacao_attributes][:desc_nome]
          @identificacao.desc_fone = ocorrencium_params[:identificacao_attributes][:desc_fone]
          @indetificacao.condominio_id = current_user.condominio_id
          @identificacao.save
        else
          @ocorrencium = Ocorrencium.new(ocorrencium_params)
          @ocorrencium.identificacao.desc_atividade = @ocorrencium.desc_ocorrencia
          @ocorrencium.identificacao.apartamento_id = @ocorrencium.apartamento_id
          @ocorrencium.identificacao.condominio_id - current_user.condominio_id
    end

    respond_to do |format|
      if @ocorrencium.save
        format.html { redirect_to @ocorrencium, notice: 'Cadastro realizado com sucesso.' }
        format.json { render :show, status: :created, location: @ocorrencium }
      else
        format.html { render :new }
        format.json { render json: @ocorrencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ocorrencia/1
  # PATCH/PUT /ocorrencia/1.json
  def update
    respond_to do |format|
      if @ocorrencium.update(ocorrencium_params)
        format.html { redirect_to @ocorrencium, notice: 'Alteração realizada com sucesso.' }
        format.json { render :show, status: :ok, location: @ocorrencium }
      else
        format.html { render :edit }
        format.json { render json: @ocorrencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ocorrencia/1
  # DELETE /ocorrencia/1.json
  def destroy
    @ocorrencium.destroy
    respond_to do |format|
      format.html { redirect_to ocorrencia_url, notice: 'Registro excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ocorrencium
      @ocorrencium = Ocorrencium.find(params[:id])
    end

    def ocorren_params
      params.require(:ocorrencium).permit(:data_ocorrencia, :desc_ocorrencia, :data_saida, :qdt_minutos, :identificacao_id, :apartamento_id, :tipoocorrencium_id ,:condominio_id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ocorrencium_params
      params.require(:ocorrencium).permit(:data_ocorrencia, :desc_ocorrencia, :data_saida, :qdt_minutos, :tipoocorrencium_id, :condominio_id, :apartamento_id, identificacao_attributes: [:id, :desc_identificador, :desc_nome, :desc_fone, :desc_atividade, :apartamento_id, :avatar, :condominio_id])
    end

end
