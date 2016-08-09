class ContabanksController < ApplicationController
  before_action :set_contabank, only: [:show, :edit, :update, :destroy]

  # GET /contabanks
  # GET /contabanks.json
  def index
    @contabanks = Contabank.where(condominio_id: current_user.condominio_id)
  end

  # GET /contabanks/1
  # GET /contabanks/1.json
  def show
  end

  # GET /contabanks/new
  def new
    @contabank = Contabank.new
  end

  # GET /contabanks/1/edit
  def edit
  end

  # POST /contabanks
  # POST /contabanks.json
  def create
    @contabank = Contabank.new(contabank_params)

    respond_to do |format|
      if @contabank.save
        format.html { redirect_to @contabank, notice: 'Registro incluído com sucesso.' }
        format.json { render :show, status: :created, location: @contabank }
      else
        format.html { render :new }
        format.json { render json: @contabank.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contabanks/1
  # PATCH/PUT /contabanks/1.json
  def update
    respond_to do |format|
      if @contabank.update(contabank_params)
        format.html { redirect_to @contabank, notice: 'Registro alterado com sucesso.' }
        format.json { render :show, status: :ok, location: @contabank }
      else
        format.html { render :edit }
        format.json { render json: @contabank.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contabanks/1
  # DELETE /contabanks/1.json
  def destroy
    @contabank.destroy
    respond_to do |format|
      format.html { redirect_to contabanks_url, notice: 'Registro excluído com sucesso.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contabank
      @contabank = Contabank.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contabank_params
      params.require(:contabank).permit(:numr_agencia, :numr_conta, :nome_banco, :situacao, :condominio_id, :user_inclusao)
    end
end
