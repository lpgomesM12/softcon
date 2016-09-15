class TipoocorrenciaController < ApplicationController
  before_action :set_tipoocorrencium, only: [:show, :edit, :update, :destroy]

  # GET /tipoocorrencia
  # GET /tipoocorrencia.json
  def index
    @tipoocorrencia = Tipoocorrencium.all
  end

  # GET /tipoocorrencia/1
  # GET /tipoocorrencia/1.json
  def show
  end

  # GET /tipoocorrencia/new
  def new
    @tipoocorrencium = Tipoocorrencium.new
  end

  # GET /tipoocorrencia/1/edit
  def edit
  end

  # POST /tipoocorrencia
  # POST /tipoocorrencia.json
  def create
    @tipoocorrencium = Tipoocorrencium.new(tipoocorrencium_params)

    respond_to do |format|
      if @tipoocorrencium.save
        format.html { redirect_to @tipoocorrencium, notice: 'Tipoocorrencium was successfully created.' }
        format.json { render :show, status: :created, location: @tipoocorrencium }
      else
        format.html { render :new }
        format.json { render json: @tipoocorrencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipoocorrencia/1
  # PATCH/PUT /tipoocorrencia/1.json
  def update
    respond_to do |format|
      if @tipoocorrencium.update(tipoocorrencium_params)
        format.html { redirect_to @tipoocorrencium, notice: 'Tipoocorrencium was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipoocorrencium }
      else
        format.html { render :edit }
        format.json { render json: @tipoocorrencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipoocorrencia/1
  # DELETE /tipoocorrencia/1.json
  def destroy
    @tipoocorrencium.destroy
    respond_to do |format|
      format.html { redirect_to tipoocorrencia_url, notice: 'Tipoocorrencium was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipoocorrencium
      @tipoocorrencium = Tipoocorrencium.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipoocorrencium_params
      params.require(:tipoocorrencium).permit(:desc_tipoocorrencia)
    end
end
