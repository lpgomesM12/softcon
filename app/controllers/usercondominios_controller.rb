class UsercondominiosController < ApplicationController
  before_action :set_usercondominio, only: [:show, :edit, :update, :destroy]

  # GET /usercondominios
  # GET /usercondominios.json
  def index
    @usercondominios = Usercondominio.all
  end

  # GET /usercondominios/1
  # GET /usercondominios/1.json
  def show
  end

  # GET /usercondominios/new
  def new
    @usercondominio = Usercondominio.new
  end

  # GET /usercondominios/1/edit
  def edit
  end

  # POST /usercondominios
  # POST /usercondominios.json
  def create
    @usercondominio = Usercondominio.new(usercondominio_params)

    respond_to do |format|
      if @usercondominio.save
        format.html { redirect_to @usercondominio, notice: 'Usercondominio was successfully created.' }
        format.json { render :show, status: :created, location: @usercondominio }
      else
        format.html { render :new }
        format.json { render json: @usercondominio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usercondominios/1
  # PATCH/PUT /usercondominios/1.json
  def update
    respond_to do |format|
      if @usercondominio.update(usercondominio_params)
        format.html { redirect_to @usercondominio, notice: 'Usercondominio was successfully updated.' }
        format.json { render :show, status: :ok, location: @usercondominio }
      else
        format.html { render :edit }
        format.json { render json: @usercondominio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usercondominios/1
  # DELETE /usercondominios/1.json
  def destroy
    @usercondominio.destroy
    respond_to do |format|
      format.html { redirect_to usercondominios_url, notice: 'Usercondominio was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usercondominio
      @usercondominio = Usercondominio.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usercondominio_params
      params.require(:usercondominio).permit(:user_id, :funcao_id, :condominio_id)
    end
end
