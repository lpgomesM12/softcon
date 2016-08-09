class CategoriaprestadorsController < ApplicationController
  before_action :set_categoriaprestador, only: [:show, :edit, :update, :destroy]

  # GET /categoriaprestadors
  # GET /categoriaprestadors.json
  def index
    @categoriaprestadors = Categoriaprestador.all
  end

  # GET /categoriaprestadors/1
  # GET /categoriaprestadors/1.json
  def show
  end

  # GET /categoriaprestadors/new
  def new
    @categoriaprestador = Categoriaprestador.new
  end

  # GET /categoriaprestadors/1/edit
  def edit
  end

  # POST /categoriaprestadors
  # POST /categoriaprestadors.json
  def create
    @categoriaprestador = Categoriaprestador.new(categoriaprestador_params)

    respond_to do |format|
      if @categoriaprestador.save
        format.html { redirect_to @categoriaprestador, notice: 'Categoriaprestador was successfully created.' }
        format.json { render :show, status: :created, location: @categoriaprestador }
      else
        format.html { render :new }
        format.json { render json: @categoriaprestador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categoriaprestadors/1
  # PATCH/PUT /categoriaprestadors/1.json
  def update
    respond_to do |format|
      if @categoriaprestador.update(categoriaprestador_params)
        format.html { redirect_to @categoriaprestador, notice: 'Categoriaprestador was successfully updated.' }
        format.json { render :show, status: :ok, location: @categoriaprestador }
      else
        format.html { render :edit }
        format.json { render json: @categoriaprestador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoriaprestadors/1
  # DELETE /categoriaprestadors/1.json
  def destroy
    @categoriaprestador.destroy
    respond_to do |format|
      format.html { redirect_to categoriaprestadors_url, notice: 'Categoriaprestador was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoriaprestador
      @categoriaprestador = Categoriaprestador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categoriaprestador_params
      params.require(:categoriaprestador).permit(:nome_categoria)
    end
end
