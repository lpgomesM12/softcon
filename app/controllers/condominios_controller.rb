class CondominiosController < ApplicationController
  before_action :set_condominio, only: [:show, :edit, :update, :destroy]


  def muda_condominio
     @user = User.find(current_user.id)
     @user.condominio_id = params[:condominio]
     if @user.save
        render :json => true
      else
        render :json => false
     end
  end

  # GET /condominios
  # GET /condominios.json
  def index
    @condominios = Condominio.all
  end

  # GET /condominios/1
  # GET /condominios/1.json
  def show
  end

  # GET /condominios/new
  def new
    @condominio = Condominio.new
    @condominio.build_endereco
  end

  # GET /condominios/1/edit
  def edit

    @estado = @condominio.endereco.cidade.estado.id
    @cidade = Cidade.where(estado_id: @estado)
    @cidade_setada = @condominio.endereco.cidade.id

    @bairro = Bairro.where(id: @condominio.endereco.bairro_id)
    @bairro_setado = @condominio.endereco.bairro_id

  end

  # POST /condominios
  # POST /condominios.json
  def create
    @condominio = Condominio.new(condominio_params)

    respond_to do |format|
      if @condominio.save

        if current_user.id == 1
           Grupopermissaouser.create(:user_id => 1, :grupopermissao_id => 1, :condominio_id => @condominio.id)
        end

        format.html { redirect_to @condominio, notice: 'Condominio was successfully created.' }
        format.json { render :show, status: :created, location: @condominio }
      else
        format.html { render :new }
        format.json { render json: @condominio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /condominios/1
  # PATCH/PUT /condominios/1.json
  def update
    respond_to do |format|
      if @condominio.update(condominio_params)
        format.html { redirect_to @condominio, notice: 'Condominio was successfully updated.' }
        format.json { render :show, status: :ok, location: @condominio }
      else
        format.html { render :edit }
        format.json { render json: @condominio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /condominios/1
  # DELETE /condominios/1.json
  def destroy
    @condominio.destroy
    respond_to do |format|
      format.html { redirect_to condominios_url, notice: 'Condominio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_condominio
      @condominio = Condominio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def condominio_params
      params.require(:condominio).permit(:nome_condominio, :data_cancelamento, :email, endereco_attributes: [ :id, :desc_endereco, :desc_cep, :cidade_id, :bairro_id])
    end
end
