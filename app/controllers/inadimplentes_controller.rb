class InadimplentesController < ApplicationController
  before_action :set_inadimplente, only: [:show, :edit, :update, :destroy]

  # GET /inadimplentes
  # GET /inadimplentes.json
  def index
    @inadimplentes = Inadimplente.all
  end

  # GET /inadimplentes/1
  # GET /inadimplentes/1.json
  def show
  end

  # GET /inadimplentes/new
  def new
    @inadimplente = Inadimplente.new
  end

  # GET /inadimplentes/1/edit
  def edit
  end

  # POST /inadimplentes
  # POST /inadimplentes.json
  def create
    @inadimplente = Inadimplente.new(inadimplente_params)

    respond_to do |format|
      if @inadimplente.save
        format.html { redirect_to @inadimplente, notice: 'Inadimplente was successfully created.' }
        format.json { render :show, status: :created, location: @inadimplente }
      else
        format.html { render :new }
        format.json { render json: @inadimplente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inadimplentes/1
  # PATCH/PUT /inadimplentes/1.json
  def update
    respond_to do |format|
      if @inadimplente.update(inadimplente_params)
        format.html { redirect_to @inadimplente, notice: 'Inadimplente was successfully updated.' }
        format.json { render :show, status: :ok, location: @inadimplente }
      else
        format.html { render :edit }
        format.json { render json: @inadimplente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inadimplentes/1
  # DELETE /inadimplentes/1.json
  def destroy
    @inadimplente.destroy
    respond_to do |format|
      format.html { redirect_to inadimplentes_url, notice: 'Inadimplente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inadimplente
      @inadimplente = Inadimplente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def inadimplente_params
      params.require(:inadimplente).permit(:apartamento_id)
    end
end
