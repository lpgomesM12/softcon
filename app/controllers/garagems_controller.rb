class GaragemsController < ApplicationController
  before_action :set_garagem, only: [:show, :edit, :update, :destroy]

  # GET /garagems
  # GET /garagems.json
  def index
    @garagems = Garagem.all
  end

  # GET /garagems/1
  # GET /garagems/1.json
  def show
  end

  # GET /garagems/new
  def new
    @garagem = Garagem.new
  end

  # GET /garagems/1/edit
  def edit
  end

  # POST /garagems
  # POST /garagems.json
  def create
    @garagem = Garagem.new(garagem_params)

    respond_to do |format|
      if @garagem.save
        format.html { redirect_to @garagem, notice: 'Garagem was successfully created.' }
        format.json { render :show, status: :created, location: @garagem }
      else
        format.html { render :new }
        format.json { render json: @garagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /garagems/1
  # PATCH/PUT /garagems/1.json
  def update
    respond_to do |format|
      if @garagem.update(garagem_params)
        format.html { redirect_to @garagem, notice: 'Garagem was successfully updated.' }
        format.json { render :show, status: :ok, location: @garagem }
      else
        format.html { render :edit }
        format.json { render json: @garagem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /garagems/1
  # DELETE /garagems/1.json
  def destroy
    @garagem.destroy
    respond_to do |format|
      format.html { redirect_to garagems_url, notice: 'Garagem was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_garagem
      @garagem = Garagem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def garagem_params
      params.require(:garagem).permit(:numr_garagem, :cobertura_id, :condominio_id, :apartamento_id)
    end
end
