class PessoaautorizadasController < ApplicationController
  before_action :set_pessoaautorizada, only: [:show, :edit, :update, :destroy]

  def pessoas_autorizadas
    pessoas = Pessoaautorizada.where(apartamento_id: params[:apartamento_id])

    pessoas_json = pessoas.map {|item| {:id => item.id,
                                               :desc_nome => item.identificacao.desc_nome,
                                               :desc_atribuicao => item.desc_atribuicao,
                                               :flag_pessoaautorizada => item.flag_pessoaautorizada? ? true : false}}
    render :json => pessoas_json

  end
  # GET /pessoaautorizadas
  # GET /pessoaautorizadas.json
  def index
    @pessoaautorizadas = Pessoaautorizada.all
  end

  # GET /pessoaautorizadas/1
  # GET /pessoaautorizadas/1.json
  def show
  end

  # GET /pessoaautorizadas/new
  def new
    @pessoaautorizada = Pessoaautorizada.new
    @pessoaautorizada.build_identificacao

  end

  # GET /pessoaautorizadas/1/edit
  def edit
  end

  # POST /pessoaautorizadas
  # POST /pessoaautorizadas.json
  def create
    if  params[:id_identificacao] != ""
          @pessoaautorizada = Pessoaautorizada.new(pessoaautorizada_params)
          @pessoaautorizada.identificacao_id = params[:id_identificacao]
          @identificacao = Identificacao.find(params[:id_identificacao])
          @identificacao.desc_nome = pessoaautorizada_params[:identificacao_attributes][:desc_nome]
          @identificacao.desc_fone = pessoaautorizada_params[:identificacao_attributes][:desc_fone]
          @indetificacao.condominio_id = current_user.condominio_id
          @identificacao.save
        else
          @pessoaautorizada = Pessoaautorizada.new(pessoaautorizada_params)
          @pessoaautorizada.identificacao.apartamento_id = @pessoaautorizada.apartamento_id
          @pessoaautorizada.identificacao.condominio_id = current_user.condominio_id
    end
    respond_to do |format|
      if @pessoaautorizada.save
        format.html { redirect_to @pessoaautorizada, notice: 'Cadastro realizado com sucesso.' }
        format.json { render :show, status: :created, location: @pessoaautorizada }
      else
        format.html { render :new }
        format.json { render json: @pessoaautorizada.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pessoaautorizadas/1
  # PATCH/PUT /pessoaautorizadas/1.json
  def update
    respond_to do |format|
      if @pessoaautorizada.update(pessoaautorizada_params)
        format.html { redirect_to @pessoaautorizada, notice: 'Cadastro alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @pessoaautorizada }
      else
        format.html { render :edit }
        format.json { render json: @pessoaautorizada.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pessoaautorizadas/1
  # DELETE /pessoaautorizadas/1.json
  def destroy
    @pessoaautorizada.destroy
    respond_to do |format|
      format.html { redirect_to pessoaautorizadas_url, notice: 'Cadastro deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pessoaautorizada
      @pessoaautorizada = Pessoaautorizada.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pessoaautorizada_params
      params.require(:pessoaautorizada).permit(:flag_pessoaautorizada, :flag_pessoabloqueada, :desc_atribuicao, :flag_todasemana, :flag_segunda, :flag_terca, :flag_quarta, :flag_quinta, :flag_sexta, :flag_sabado, :flag_domingo, :flag_periodo, :data_periodoinicio, :data_periodofim, :flag_nestadata, :data_nessadata, :numr_horainicio, :numr_horafim, :apartamento_id, :condominio_id, identificacao_attributes: [ :id, :desc_identificador, :desc_nome, :desc_fone ])
    end
end
