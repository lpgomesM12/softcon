class UsuariosController < ApplicationController
  def index
    @users = User.where(condominio_id: current_user.condominio_id)
  end
end
