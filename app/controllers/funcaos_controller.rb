class FuncaosController < ApplicationController
  before_action :set_funcao, only: [:show, :edit, :update, :destroy]

  # GET /funcaos
  # GET /funcaos.json
  def index
    @funcaos = Funcao.all
  end

  # GET /funcaos/1
  # GET /funcaos/1.json
  def show
  end

  # GET /funcaos/new
  def new
    @funcao = Funcao.new
  end

  # GET /funcaos/1/edit
  def edit
  end

  # POST /funcaos
  # POST /funcaos.json
  def create
    @funcao = Funcao.new(funcao_params)

    respond_to do |format|
      if @funcao.save
        format.html { redirect_to @funcao, notice: 'Funcao was successfully created.' }
        format.json { render :show, status: :created, location: @funcao }
      else
        format.html { render :new }
        format.json { render json: @funcao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcaos/1
  # PATCH/PUT /funcaos/1.json
  def update
    respond_to do |format|
      if @funcao.update(funcao_params)
        format.html { redirect_to @funcao, notice: 'Funcao was successfully updated.' }
        format.json { render :show, status: :ok, location: @funcao }
      else
        format.html { render :edit }
        format.json { render json: @funcao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcaos/1
  # DELETE /funcaos/1.json
  def destroy
    @funcao.destroy
    respond_to do |format|
      format.html { redirect_to funcaos_url, notice: 'Funcao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcao
      @funcao = Funcao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def funcao_params
      params.require(:funcao).permit(:desc_funcao)
    end
end
