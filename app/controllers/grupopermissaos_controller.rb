class GrupopermissaosController < ApplicationController
  before_action :set_grupopermissao, only: [:show, :edit, :update, :destroy]

  # GET /grupopermissaos
  # GET /grupopermissaos.json
  def index
    @grupopermissaos = Grupopermissao.all
  end

  # GET /grupopermissaos/1
  # GET /grupopermissaos/1.json
  def show
  end

  # GET /grupopermissaos/new
  def new
    @grupopermissao = Grupopermissao.new
  end

  # GET /grupopermissaos/1/edit
  def edit
  end

  # POST /grupopermissaos
  # POST /grupopermissaos.json
  def create
    @grupopermissao = Grupopermissao.new(grupopermissao_params)

    respond_to do |format|
      if @grupopermissao.save
        format.html { redirect_to @grupopermissao, notice: 'Grupopermissao was successfully created.' }
        format.json { render :show, status: :created, location: @grupopermissao }
      else
        format.html { render :new }
        format.json { render json: @grupopermissao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grupopermissaos/1
  # PATCH/PUT /grupopermissaos/1.json
  def update
    respond_to do |format|
      if @grupopermissao.update(grupopermissao_params)
        format.html { redirect_to @grupopermissao, notice: 'Grupopermissao was successfully updated.' }
        format.json { render :show, status: :ok, location: @grupopermissao }
      else
        format.html { render :edit }
        format.json { render json: @grupopermissao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupopermissaos/1
  # DELETE /grupopermissaos/1.json
  def destroy
    @grupopermissao.destroy
    respond_to do |format|
      format.html { redirect_to grupopermissaos_url, notice: 'Grupopermissao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupopermissao
      @grupopermissao = Grupopermissao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grupopermissao_params
      params.require(:grupopermissao).permit(:nome)
    end
end
