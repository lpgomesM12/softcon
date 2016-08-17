class UsuariosController < ApplicationController

  before_action :set_usuario, only: [:destroy]

  def index
    @users = User.where(condominio_id: current_user.condominio_id, flag_exclusao: nil)
  end

  def show
  end


  def destroy
    # @user.user_exclusao = current_user.id
    # @user.flag_exclusao = true
    # @user.email = Time.now.to_s + "@gmail.com"
    @user.destroy
    respond_to do |format|
      format.html { redirect_to usuarios_path, notice: 'Cidade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usuario
      @user = User.find(params[:id])
    end

end
