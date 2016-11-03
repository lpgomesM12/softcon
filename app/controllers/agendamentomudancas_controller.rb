class AgendamentomudancasController < ApplicationController
  before_action :set_agendamentomudanca, only: [:show, :edit, :update, :destroy]


 def relmudanca

    @condominio = current_user.condominio.nome_condominio
    @agendamentomudanca = Agendamentomudanca.find(params[:id])

  respond_to do |format|
      format.html
      format.pdf {
      render pdf: "reserva"
      }
   end

 end

  # GET /agendamentomudancas
  # GET /agendamentomudancas.json
  def index
    @agendamentomudancas = Agendamentomudanca.all
  end

  # GET /agendamentomudancas/1
  # GET /agendamentomudancas/1.json
  def show
  end

  # GET /agendamentomudancas/new
  def new
    @agendamentomudanca = Agendamentomudanca.new
  end

  # GET /agendamentomudancas/1/edit
  def edit
    @agendamentomudanca.data_agendamento = @agendamentomudanca.data_agendamento.blank? ? '' : @agendamentomudanca.data_agendamento.strftime("%d/%m/%Y")
  end

  # POST /agendamentomudancas
  # POST /agendamentomudancas.json
  def create
    @agendamentomudanca = Agendamentomudanca.new(agendamentomudanca_params)

    respond_to do |format|
      if @agendamentomudanca.save
        format.html { redirect_to @agendamentomudanca, notice: 'Agendamento cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @agendamentomudanca }
      else
        format.html { render :new }
        format.json { render json: @agendamentomudanca.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agendamentomudancas/1
  # PATCH/PUT /agendamentomudancas/1.json
  def update
    respond_to do |format|
      if @agendamentomudanca.update(agendamentomudanca_params)
        format.html { redirect_to @agendamentomudanca, notice: 'Agendamento alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @agendamentomudanca }
      else
        format.html { render :edit }
        format.json { render json: @agendamentomudanca.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agendamentomudancas/1
  # DELETE /agendamentomudancas/1.json
  def destroy
    @agendamentomudanca.destroy
    respond_to do |format|
      format.html { redirect_to agendamentomudancas_url, notice: 'Agendamento deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agendamentomudanca
      @agendamentomudanca = Agendamentomudanca.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agendamentomudanca_params
      params.require(:agendamentomudanca).permit(:nome, :fone, :apartamento_id, :data_agendamento, :valr_taxa, :periodo, :flag_entrada, :flag_saida, :observacao, :condominio_id)
    end
end
