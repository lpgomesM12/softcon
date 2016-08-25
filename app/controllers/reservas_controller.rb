class ReservasController < ApplicationController
  before_action :set_reserva, only: [:show, :edit, :update, :destroy]


  def aprovar_reserva
     @reserva = Reserva.find(params[:id])
     @reserva.flag_autorizado = true
     @reserva.data_autorizacao = Time.now
     @reserva.user_autorizacao = current_user.id

     if @reserva.save
        Email.welcome_email(@reserva).deliver_now
        render :json => true
      else
        render :json => false
     end

  end

  def negar_reserva
     @reserva = Reserva.find(params[:id])
     @reserva.flag_autorizado = false
     @reserva.data_cancelamento = Time.now
     @reserva.user_cancelamento = current_user.id
     @reserva.desc_motivocancelamento = params[:motivo]

     if @reserva.save
        render :json => true

        if @reserva.email_solicitante == @reserva.userinclusao.email
           emails = [@reserva.email_solicitante,current_user.condominio.email]
       else
          emails = [@reserva.email_solicitante,@reserva.userinclusao.email,current_user.condominio.email]
        end

        for email in emails
            ReservaNegada.send_email(@reserva,email).deliver
        end

      else
        render :json => false
     end
  end

  # GET /reservas
  # GET /reservas.json
  def index
   if current_user.tem_permissao(4)
      @reservas = Reserva.where(user_inclusao: current_user.id)
    else
      @reservas = Reserva.where(condominio_id: current_user.condominio_id, flag_autorizado: false, user_cancelamento: nil)
   end

  end

  # GET /reservas/1
  # GET /reservas/1.json
  def show

    respond_to do |format|
      format.html
      format.pdf { render pdf: "reserva",
        header: {center: "Comprovante reserva"},
        footer: { center: "[page] de [topage]" }
        }
    end

  end

  # GET /reservas/new
  def new
    @reserva = Reserva.new
  end

  # GET /reservas/1/edit
  def edit
  end

  # POST /reservas
  # POST /reservas.json
  def create
    @reserva = Reserva.new(reserva_params)

    respond_to do |format|
      if @reserva.save

        if @reserva.email_solicitante == current_user.email
           emails = [@reserva.email_solicitante,current_user.condominio.email]
       else
          emails = [@reserva.email_solicitante,current_user.email,current_user.condominio.email]
        end

        for email in emails
            Email.send_email(@reserva,email).deliver
        end

        format.html { redirect_to @reserva, notice: 'Reserva solicitada com sucesso.' }
        format.json { render :show, status: :created, location: @reserva }
      else
        format.html { render :new }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservas/1
  # PATCH/PUT /reservas/1.json
  def update
    respond_to do |format|
      if @reserva.update(reserva_params)
        format.html { redirect_to @reserva, notice: 'Reserva was successfully updated.' }
        format.json { render :show, status: :ok, location: @reserva }
      else
        format.html { render :edit }
        format.json { render json: @reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservas/1
  # DELETE /reservas/1.json
  def destroy
    @reserva.destroy
    respond_to do |format|
      format.html { redirect_to reservas_url, notice: 'Reserva was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reserva
      @reserva = Reserva.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reserva_params
      params.require(:reserva).permit(:data_reserva, :hora_inicio, :hora_fim, :tiporeserva_id, :data_cancelamento, :apartamento_id, :valr_reserva, :flag_autorizado, :nome_solicitante, :email_solicitante, :condominio_id, :data_autorizacao, :user_inclusao, :user_cancelamento, :user_autorizacao)
    end
end
