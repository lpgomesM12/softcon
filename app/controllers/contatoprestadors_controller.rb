class ContatoprestadorsController < ApplicationController
  before_action :set_contatoprestador, only: [:show, :edit, :update, :destroy]

  # GET /contatoprestadors
  # GET /contatoprestadors.json
  def index
    @contatoprestadors = Contatoprestador.all
  end

  # GET /contatoprestadors/1
  # GET /contatoprestadors/1.json
  def show
  end

  # GET /contatoprestadors/new
  def new
    @contatoprestador = Contatoprestador.new
  end

  # GET /contatoprestadors/1/edit
  def edit
  end

  # POST /contatoprestadors
  # POST /contatoprestadors.json
  def create
    @contatoprestador = Contatoprestador.new(contatoprestador_params)

    respond_to do |format|
      if @contatoprestador.save
        format.html { redirect_to @contatoprestador, notice: 'Contatoprestador was successfully created.' }
        format.json { render :show, status: :created, location: @contatoprestador }
      else
        format.html { render :new }
        format.json { render json: @contatoprestador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contatoprestadors/1
  # PATCH/PUT /contatoprestadors/1.json
  def update
    respond_to do |format|
      if @contatoprestador.update(contatoprestador_params)
        format.html { redirect_to @contatoprestador, notice: 'Contatoprestador was successfully updated.' }
        format.json { render :show, status: :ok, location: @contatoprestador }
      else
        format.html { render :edit }
        format.json { render json: @contatoprestador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contatoprestadors/1
  # DELETE /contatoprestadors/1.json
  def destroy
    @contatoprestador.destroy
    respond_to do |format|
      format.html { redirect_to contatoprestadors_url, notice: 'Contatoprestador was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contatoprestador
      @contatoprestador = Contatoprestador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contatoprestador_params
      params.require(:contatoprestador).permit(:desc_tipocontado, :desc_contato, :prestador_id)
    end
end
