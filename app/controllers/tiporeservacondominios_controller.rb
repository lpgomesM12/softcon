class TiporeservacondominiosController < ApplicationController
  before_action :set_tiporeservacondominio, only: [:show, :edit, :update, :destroy]

  # GET /tiporeservacondominios
  # GET /tiporeservacondominios.json
  def index
    @tiporeservacondominios = Tiporeservacondominio.all
  end

  # GET /tiporeservacondominios/1
  # GET /tiporeservacondominios/1.json
  def show
  end

  # GET /tiporeservacondominios/new
  def new
    @tiporeservacondominio = Tiporeservacondominio.new
  end

  # GET /tiporeservacondominios/1/edit
  def edit
  end

  # POST /tiporeservacondominios
  # POST /tiporeservacondominios.json
  def create
    @tiporeservacondominio = Tiporeservacondominio.new(tiporeservacondominio_params)

    respond_to do |format|
      if @tiporeservacondominio.save
        format.html { redirect_to @tiporeservacondominio, notice: 'Tiporeservacondominio was successfully created.' }
        format.json { render :show, status: :created, location: @tiporeservacondominio }
      else
        format.html { render :new }
        format.json { render json: @tiporeservacondominio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tiporeservacondominios/1
  # PATCH/PUT /tiporeservacondominios/1.json
  def update
    respond_to do |format|
      if @tiporeservacondominio.update(tiporeservacondominio_params)
        format.html { redirect_to @tiporeservacondominio, notice: 'Tiporeservacondominio was successfully updated.' }
        format.json { render :show, status: :ok, location: @tiporeservacondominio }
      else
        format.html { render :edit }
        format.json { render json: @tiporeservacondominio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tiporeservacondominios/1
  # DELETE /tiporeservacondominios/1.json
  def destroy
    @tiporeservacondominio.destroy
    respond_to do |format|
      format.html { redirect_to tiporeservacondominios_url, notice: 'Tiporeservacondominio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tiporeservacondominio
      @tiporeservacondominio = Tiporeservacondominio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tiporeservacondominio_params
      params.require(:tiporeservacondominio).permit(:tiporeserva_id, :condominio_id)
    end
end
