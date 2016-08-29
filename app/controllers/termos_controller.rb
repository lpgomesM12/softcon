class TermosController < ApplicationController
  before_action :set_termo, only: [:show, :edit, :update, :destroy]

  # GET /termos
  # GET /termos.json
  def index
    @termos = Termo.all
  end

  # GET /termos/1
  # GET /termos/1.json
  def show
  end

  # GET /termos/new
  def new
    @termo = Termo.new
  end

  # GET /termos/1/edit
  def edit
  end

  # POST /termos
  # POST /termos.json
  def create
    @termo = Termo.new(termo_params)

    respond_to do |format|
      if @termo.save
        format.html { redirect_to @termo, notice: 'Termo was successfully created.' }
        format.json { render :show, status: :created, location: @termo }
      else
        format.html { render :new }
        format.json { render json: @termo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /termos/1
  # PATCH/PUT /termos/1.json
  def update
    respond_to do |format|
      if @termo.update(termo_params)
        format.html { redirect_to @termo, notice: 'Termo was successfully updated.' }
        format.json { render :show, status: :ok, location: @termo }
      else
        format.html { render :edit }
        format.json { render json: @termo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /termos/1
  # DELETE /termos/1.json
  def destroy
    @termo.destroy
    respond_to do |format|
      format.html { redirect_to termos_url, notice: 'Termo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_termo
      @termo = Termo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def termo_params
      params.require(:termo).permit(:nome_termo, :text_termo, :tipotermo_id, :condominio_id)
    end
end
