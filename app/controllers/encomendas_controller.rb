class EncomendasController < ApplicationController
  before_action :set_encomenda, only: [:show, :edit, :update, :destroy]

  def entrega_encomenda

    @encomenda = Encomenda.find(params[:id])
    @encomenda.user_entrega = current_user.id
    @encomenda.data_entrega = params[:data_entrega]

     if @encomenda.save
        render :json => true
     else
       render :json => false
     end
  end


  # GET /encomendas
  # GET /encomendas.json
  def index
    @encomendas = Encomenda.where(condominio_id: current_user.condominio_id)
  end

  # GET /encomendas/1
  # GET /encomendas/1.json
  def show
  end

  # GET /encomendas/new
  def new
    @encomenda = Encomenda.new
  end

  # GET /encomendas/1/edit
  def edit
  end

  # POST /encomendas
  # POST /encomendas.json
  def create
    @encomenda = Encomenda.new(encomenda_params)
    respond_to do |format|
      if @encomenda.save

        if @encomenda.morador.pessoa.email_pessoa != nil
           EncomendaInfo.send_email(@encomenda,@encomenda.morador.pessoa.email_pessoa,current_user.condominio.email).deliver
        end
        format.html { redirect_to @encomenda, notice: 'Encomenda cadastrada com sucesso' }
        format.json { render :show, status: :created, location: @encomenda }
      else
        format.html { render :new }
        format.json { render json: @encomenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /encomendas/1
  # PATCH/PUT /encomendas/1.json
  def update
    respond_to do |format|
      if @encomenda.update(encomenda_params)
        format.html { redirect_to @encomenda, notice: 'Encomenda atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @encomenda }
      else
        format.html { render :edit }
        format.json { render json: @encomenda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /encomendas/1
  # DELETE /encomendas/1.json
  def destroy
    @encomenda.destroy
    respond_to do |format|
      format.html { redirect_to encomendas_url, notice: 'Registro excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_encomenda
      @encomenda = Encomenda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def encomenda_params
      params.require(:encomenda).permit(:msg_encomenda, :data_encomenda, :data_entrega, :condominio_id, :morador_id, :user_inclusao, :user_entrega, :condominio_id)
    end
end
