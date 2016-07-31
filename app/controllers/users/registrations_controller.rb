class Users::RegistrationsController < Devise::RegistrationsController

	prepend_before_filter :require_no_authentication, :only => [:cancel ]
	prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]

  def new
    build_resource({})
    #respond_with self.resource
  end

  def sign_up(resource_name, resource)
    #sign_in(resource_name, resource)
  end

  def create
    build_resource(sign_up_params)

    @condominio = params[:condominio_id]
		@grupopermissao = params[:grupopermissao]
		@pessoa = params[:pessoa_id]

    resource.condominio_id = @condominio
    resource.pessoa_id = @pessoa

    if resource.save
        @grupopermissaouser = Grupopermissaouser.new
				@grupopermissaouser.user_id = resource.id
				@grupopermissaouser.grupopermissao_id = @grupopermissao
				@grupopermissaouser.condominio_id = @condominio
				@grupopermissaouser.save

      yield resource if block_given?
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_flashing_format?
        #sign_up(resource_name, resource)
        #respond_with resource, :location => after_sign_up_path_for(resource)
        redirect_to root_path
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_flashing_format?
        expire_data_after_sign_in!
        respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  def update
    super
  end

  def after_update_path_for(resource)
    case resource
    when :user, User
      root_path
    else
      super
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @sivic_user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :pessoa_id, :condominio_id, :grupopermissao_id)
    end

end
