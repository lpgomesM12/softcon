class TiporeservasController < ApplicationController
  before_action :set_tiporeserva, only: [:show, :edit, :update, :destroy]

  # GET /tiporeservas
  # GET /tiporeservas.json
  def index
    @tiporeservas = Tiporeserva.all
  end

  # GET /tiporeservas/1
  # GET /tiporeservas/1.json
  def show
  end

  # GET /tiporeservas/new
  def new
    @tiporeserva = Tiporeserva.new
  end

  # GET /tiporeservas/1/edit
  def edit
  end

  # POST /tiporeservas
  # POST /tiporeservas.json
  def create
    @tiporeserva = Tiporeserva.new(tiporeserva_params)

    respond_to do |format|
      if @tiporeserva.save
        format.html { redirect_to @tiporeserva, notice: 'Tiporeserva was successfully created.' }
        format.json { render :show, status: :created, location: @tiporeserva }
      else
        format.html { render :new }
        format.json { render json: @tiporeserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tiporeservas/1
  # PATCH/PUT /tiporeservas/1.json
  def update
    respond_to do |format|
      if @tiporeserva.update(tiporeserva_params)
        format.html { redirect_to @tiporeserva, notice: 'Tiporeserva was successfully updated.' }
        format.json { render :show, status: :ok, location: @tiporeserva }
      else
        format.html { render :edit }
        format.json { render json: @tiporeserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tiporeservas/1
  # DELETE /tiporeservas/1.json
  def destroy
    @tiporeserva.destroy
    respond_to do |format|
      format.html { redirect_to tiporeservas_url, notice: 'Tiporeserva was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tiporeserva
      @tiporeserva = Tiporeserva.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tiporeserva_params
      params.require(:tiporeserva).permit(:desc_tiporeserva)
    end
end
