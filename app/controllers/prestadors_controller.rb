class PrestadorsController < ApplicationController
  before_action :set_prestador, only: [:show, :edit, :update, :destroy]


  def busca_prestador
     @prestaores = Prestador.search(params[:term]).limit(10)
  end

  # GET /prestadors
  # GET /prestadors.json
  def index
    @prestadors = Prestador.all
  end

  # GET /prestadors/1
  # GET /prestadors/1.json
  def show
  end

  # GET /prestadors/new
  def new
    @prestador = Prestador.new
    @prestador.contatoprestadors.build
  end

  # GET /prestadors/1/edit
  def edit
  end

  # POST /prestadors
  # POST /prestadors.json
  def create
    @prestador = Prestador.new(prestador_params)

    respond_to do |format|
      if @prestador.save
        format.html { redirect_to @prestador, notice: 'Prestador cadastrado com sucesso.' }
        format.json { render :show, status: :created, location: @prestador }
      else
        format.html { render :new }
        format.json { render json: @prestador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /prestadors/1
  # PATCH/PUT /prestadors/1.json
  def update
    respond_to do |format|
      if @prestador.update(prestador_params)
        format.html { redirect_to @prestador, notice: 'Prestador alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @prestador }
      else
        format.html { render :edit }
        format.json { render json: @prestador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /prestadors/1
  # DELETE /prestadors/1.json
  def destroy
    @prestador.destroy
    respond_to do |format|
      format.html { redirect_to prestadors_url, notice: 'Prestador deletado com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_prestador
      @prestador = Prestador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def prestador_params
      params.require(:prestador).permit(:desc_cpfcnpj, :nome_prestador, :nome_responsavel, :observacao, :categoriaprestador_id, :condominio_id, contatoprestadors_attributes: [ :id, :desc_tipocontado, :desc_contato, :_destroy ])
    end
end
