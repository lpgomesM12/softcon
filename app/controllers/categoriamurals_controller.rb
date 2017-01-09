class CategoriamuralsController < ApplicationController
  before_action :set_categoriamural, only: [:show, :edit, :update, :destroy]

  # GET /categoriamurals
  # GET /categoriamurals.json
  def index
    @categoriamurals = Categoriamural.all
  end

  # GET /categoriamurals/1
  # GET /categoriamurals/1.json
  def show
  end

  # GET /categoriamurals/new
  def new
    @categoriamural = Categoriamural.new
  end

  # GET /categoriamurals/1/edit
  def edit
  end

  # POST /categoriamurals
  # POST /categoriamurals.json
  def create
    @categoriamural = Categoriamural.new(categoriamural_params)

    respond_to do |format|
      if @categoriamural.save
        format.html { redirect_to @categoriamural, notice: 'Categoriamural was successfully created.' }
        format.json { render :show, status: :created, location: @categoriamural }
      else
        format.html { render :new }
        format.json { render json: @categoriamural.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categoriamurals/1
  # PATCH/PUT /categoriamurals/1.json
  def update
    respond_to do |format|
      if @categoriamural.update(categoriamural_params)
        format.html { redirect_to @categoriamural, notice: 'Categoriamural was successfully updated.' }
        format.json { render :show, status: :ok, location: @categoriamural }
      else
        format.html { render :edit }
        format.json { render json: @categoriamural.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categoriamurals/1
  # DELETE /categoriamurals/1.json
  def destroy
    @categoriamural.destroy
    respond_to do |format|
      format.html { redirect_to categoriamurals_url, notice: 'Categoriamural was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categoriamural
      @categoriamural = Categoriamural.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def categoriamural_params
      params.require(:categoriamural).permit(:nome_categoria, :condominio_id)
    end
end
