class AchadoperdidosController < ApplicationController
  before_action :set_achadoperdido, only: [:show, :edit, :update, :destroy]


 def relatoriotermo

   @condominio = current_user.condominio.nome_condominio
   @achadoperdido = Achadoperdido.find(params[:id])

   respond_to do |format|
     format.html
     format.pdf {
     render pdf: "reserva"
     }
   end

 end

  # GET /achadoperdidos
  # GET /achadoperdidos.json
  def index
    @achadoperdidos = Achadoperdido.where(condominio_id: current_user.condominio_id).page(params[:page]).per(10)
  end

  # GET /achadoperdidos/1
  # GET /achadoperdidos/1.json
  def show
  end

  # GET /achadoperdidos/new
  def new
    @achadoperdido = Achadoperdido.new
  end

  # GET /achadoperdidos/1/edit
  def edit
    @achadoperdido.data_achado = @achadoperdido.data_achado.blank? ? '' : @achadoperdido.data_achado.strftime("%d/%m/%Y")
  end

  # POST /achadoperdidos
  # POST /achadoperdidos.json
  def create
    @achadoperdido = Achadoperdido.new(achadoperdido_params)
    @achadoperdido.data_entrega  = @achadoperdido.morador_id != nil ? Time.zone.now : nil

    respond_to do |format|
      if @achadoperdido.save
        format.html { redirect_to @achadoperdido, notice: 'Cadastro realizado com sucesso.' }
        format.json { render :show, status: :created, location: @achadoperdido }
      else
        format.html { render :new }
        format.json { render json: @achadoperdido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /achadoperdidos/1
  # PATCH/PUT /achadoperdidos/1.json
  def update
    @achadoperdido.data_entrega  = @achadoperdido.morador_id != nil ? Time.zone.now : nil
    respond_to do |format|
      if @achadoperdido.update(achadoperdido_params)
        format.html { redirect_to @achadoperdido, notice: 'Alteração realizada com sucesso.' }
        format.json { render :show, status: :ok, location: @achadoperdido }
      else
        format.html { render :edit }
        format.json { render json: @achadoperdido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /achadoperdidos/1
  # DELETE /achadoperdidos/1.json
  def destroy
    @achadoperdido.destroy
    respond_to do |format|
      format.html { redirect_to achadoperdidos_url, notice: 'Exclusão realizada com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_achadoperdido
      @achadoperdido = Achadoperdido.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def achadoperdido_params
      params.require(:achadoperdido).permit(:descricao, :data_achado, :data_entrega, :observacao, :morador_id, :condominio_id)
    end
end
