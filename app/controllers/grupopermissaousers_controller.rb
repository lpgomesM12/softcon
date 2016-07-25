class GrupopermissaousersController < ApplicationController
  before_action :set_grupopermissaouser, only: [:show, :edit, :update, :destroy]


  def busca_permissoes
    grupopermissaousers = Grupopermissaouser.where(user_id: current_user.id)
    permissoes_json = grupopermissaousers.map {|item| {:id => item.condominio.id,
                                                       :nome_condominio => item.condominio.nome_condominio,
                                                       :permissao => item.grupopermissao.nome}}
    render :json => permissoes_json
  end
  # GET /grupopermissaousers
  # GET /grupopermissaousers.json
  def index
    @grupopermissaousers = Grupopermissaouser.all
  end

  # GET /grupopermissaousers/1
  # GET /grupopermissaousers/1.json
  def show
  end

  # GET /grupopermissaousers/new
  def new
    @grupopermissaouser = Grupopermissaouser.new
  end

  # GET /grupopermissaousers/1/edit
  def edit
  end

  # POST /grupopermissaousers
  # POST /grupopermissaousers.json
  def create
    @grupopermissaouser = Grupopermissaouser.new(grupopermissaouser_params)

    respond_to do |format|
      if @grupopermissaouser.save
        format.html { redirect_to @grupopermissaouser, notice: 'Grupopermissaouser was successfully created.' }
        format.json { render :show, status: :created, location: @grupopermissaouser }
      else
        format.html { render :new }
        format.json { render json: @grupopermissaouser.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grupopermissaousers/1
  # PATCH/PUT /grupopermissaousers/1.json
  def update
    respond_to do |format|
      if @grupopermissaouser.update(grupopermissaouser_params)
        format.html { redirect_to @grupopermissaouser, notice: 'Grupopermissaouser was successfully updated.' }
        format.json { render :show, status: :ok, location: @grupopermissaouser }
      else
        format.html { render :edit }
        format.json { render json: @grupopermissaouser.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupopermissaousers/1
  # DELETE /grupopermissaousers/1.json
  def destroy
    @grupopermissaouser.destroy
    respond_to do |format|
      format.html { redirect_to grupopermissaousers_url, notice: 'Grupopermissaouser was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grupopermissaouser
      @grupopermissaouser = Grupopermissaouser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def grupopermissaouser_params
      params.require(:grupopermissaouser).permit(:user_id, :grupopermissao_id)
    end
end
