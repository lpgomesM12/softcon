class TipotermosController < ApplicationController
  before_action :set_tipotermo, only: [:show, :edit, :update, :destroy]

  # GET /tipotermos
  # GET /tipotermos.json
  def index
    @tipotermos = Tipotermo.all
  end

  # GET /tipotermos/1
  # GET /tipotermos/1.json
  def show
  end

  # GET /tipotermos/new
  def new
    @tipotermo = Tipotermo.new
  end

  # GET /tipotermos/1/edit
  def edit
  end

  # POST /tipotermos
  # POST /tipotermos.json
  def create
    @tipotermo = Tipotermo.new(tipotermo_params)

    respond_to do |format|
      if @tipotermo.save
        format.html { redirect_to @tipotermo, notice: 'Tipotermo was successfully created.' }
        format.json { render :show, status: :created, location: @tipotermo }
      else
        format.html { render :new }
        format.json { render json: @tipotermo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipotermos/1
  # PATCH/PUT /tipotermos/1.json
  def update
    respond_to do |format|
      if @tipotermo.update(tipotermo_params)
        format.html { redirect_to @tipotermo, notice: 'Tipotermo was successfully updated.' }
        format.json { render :show, status: :ok, location: @tipotermo }
      else
        format.html { render :edit }
        format.json { render json: @tipotermo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipotermos/1
  # DELETE /tipotermos/1.json
  def destroy
    @tipotermo.destroy
    respond_to do |format|
      format.html { redirect_to tipotermos_url, notice: 'Tipotermo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipotermo
      @tipotermo = Tipotermo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipotermo_params
      params.require(:tipotermo).permit(:nome_tipotermo, :desc_tipotermo)
    end
end
