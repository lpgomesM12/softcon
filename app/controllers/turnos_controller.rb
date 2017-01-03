class TurnosController < ApplicationController
  before_action :set_turno, only: [:show, :edit, :update, :destroy]


  def relatorio

     @turno = Turno.find(params[:id])
     @condominio = current_user.condominio.nome_condominio
          respond_to do |format|
            format.html
            format.pdf {
              render pdf: "Livro ocorrência",
            header: {center: "Relatório Livro de Ocorrência"},
            footer: { center: "[page] de [topage]" }
            }
          end
  end

 def entrega_turno
   @turno = Turno.find(params[:id])
   @turno.flag_entregue = true
   @turno.data_entrega = Time.zone.now

   if @turno.save
      render :json => true
    else
      render :json => false
   end
 end
  # GET /turnos
  # GET /turnos.json
  def index
    @turnos = Turno.all.order("created_at desc")
  end

  # GET /turnos/1
  # GET /turnos/1.json
  def show
  end

  # GET /turnos/new
  def new
    @turno = Turno.new
  end

  # GET /turnos/1/edit
  def edit
  end

  # POST /turnos
  # POST /turnos.json
  def create
    @turno = Turno.new(turno_params)

    respond_to do |format|
      if @turno.save
        format.html { redirect_to @turno, notice: 'Ocorrência cadastrada com sucesso.' }
        format.json { render :show, status: :created, location: @turno }
      else
        format.html { render :new }
        format.json { render json: @turno.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turnos/1
  # PATCH/PUT /turnos/1.json
  def update
    respond_to do |format|
      if @turno.update(turno_params)
        format.html { redirect_to @turno, notice: 'Ocorrência alterada com sucesso.' }
        format.json { render :show, status: :ok, location: @turno }
      else
        format.html { render :edit }
        format.json { render json: @turno.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turnos/1
  # DELETE /turnos/1.json
  def destroy
    @turno.destroy
    respond_to do |format|
      format.html { redirect_to turnos_url, notice: 'Ocorrência excluída com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turno
      @turno = Turno.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def turno_params
      params.require(:turno).permit(:desc_relatorio, :data_entrega, :user_id, :flag_entregue)
    end
end
