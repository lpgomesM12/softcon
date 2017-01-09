class UsuariosController < ApplicationController

  before_action :set_usuario, only: [:destroy]

  def index
    @users = User.where(condominio_id: current_user.condominio_id, flag_exclusao: nil)
  end

  def show
  end


  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_path, notice: 'Cidade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_usuario
      @user = User.find(params[:id])
    end

end
