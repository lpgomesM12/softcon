class MoradorsController < ApplicationController
  before_action :set_morador, only: [:show, :edit, :update, :destroy]


  def busca_morador
     @moradors = Pessoa.search(params[:term],current_user.condominio_id)
  end

  # GET /moradors
  # GET /moradors.json
  def index
    @moradors = Morador.where(condominio_id: current_user.condominio_id)
  end

  # GET /moradors/1
  # GET /moradors/1.json
  def show
  end

  # GET /moradors/new
  def new
    @morador = Morador.new
    @morador.build_pessoa
  end

  # GET /moradors/1/edit
  def edit
  end

  # POST /moradors
  # POST /moradors.json
  def create

  #Código comentado é na tentativa de enviar foto camera

  #  if params[:avatar] != ""
  #   encoded_picture = params[:avatar]
  #   content_type = "image/jpg"
  #   image = Paperclip.io_adapters.for("data:#{content_type};base64,#{encoded_picture}")
  #   image.original_filename = "image.jpg"
  # end

   #content_type = "image/jpg"
   #original_filename = "image.jpg"

  #   data = StringIO.new(params[:avatar])
  #   data.class_eval do
  #        attr_accessor :content_type, :original_filename
  #   end

  #   data.content_type = content_type
  #   data.original_filename = File.basename(original_filename)


  if  morador_params[:pessoa_id] != ""
        @morador = Morador.new(morador_params)
      else
        #morador_params_netested[:pessoa_attributes][:avatar] = image
        @morador = Morador.new(morador_params_netested)
    #      StringIO.open(Base64.decode64(params[:avatar])) do |data|
    #         data.class.class_eval { attr_accessor :original_filename, :content_type }
    #
    #       data.original_filename = "file.jpg"
    #       data.content_type = "image/jpeg"
    #       @morador.pessoa.avatar = data
    #
    #       #debugger
    #       #mime_type = MIME::Types.type_for(params[:avatar])
    #       #@morador.pessoa.avatar.avatar_content_type = mime_type.first
    # end
  end

   respond_to do |format|
      if @morador.save
           #if params[:avatar] != ""

             #StringIO.open(Base64.decode64(params[:avatar])) do |data|
              #    data.class.class_eval { attr_accessor :original_filename, :content_type }
              #    data.original_filename = "file.jpg"
              #    data.content_type = "image/jpeg"
                #  @pessoa = Pessoa.find(@morador.pessoa_id)
              #     @pessoa = Pessoa.new
                #  pessoa_params[:nome_pessoa] = @pesso.nome_pessoa
                #  pessoa_params[:desc_fone] = @pessoa.desc_fone
                #  pessoa_params[:cpf]  = @pessoa.cpf
                #  pessoa_params[:rg] = @pessoa.rg
                #  pessoa_params[:email_pessoa] = @pessoa.email_pessoa
                #  pessoa_params[:avatar] = data
              #    @pessoa.nome_pessoa = "Leandro P Gomes"
              #    @pessoa.avatar = data
              #    @pessoa.save
              #  end
            #end
        format.html { redirect_to @morador, notice: 'Cadastro realizado com sucesso!.' }
        format.json { render :show, status: :created, location: @morador }
      else
        format.html { render :new }
        format.json { render json: @morador.errors, status: :unprocessable_entity }
      end
    end
  end
  # PATCH/PUT /moradors/1
  # PATCH/PUT /moradors/1.json
  def update
    respond_to do |format|
      if @morador.update(morador_params_netested)
        format.html { redirect_to @morador, notice: 'Cadastro alterado com sucesso!.' }
        format.json { render :show, status: :ok, location: @morador }
      else
        format.html { render :edit }
        format.json { render json: @morador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moradors/1
  # DELETE /moradors/1.json
  def destroy
    @morador.destroy
    respond_to do |format|
      format.html { redirect_to moradors_url, notice: 'Registro excluído com sucesso!.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_morador
      @morador = Morador.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pessoa_params
      params.require(:pessoa).permit(:nome_pessoa, :desc_fone, :cpf, :rg, :email_pessoa, :avatar)
    end

    def morador_params
      params.require(:morador).permit(:apartamento_id, :pessoa_id, :user_inclusao, :condominio_id)
    end

    def morador_params_netested
      params.require(:morador).permit(:apartamento_id, :pessoa_id, :condominio_id, :user_inclusao, pessoa_attributes: [:id, :nome_pessoa, :desc_fone, :cpf, :rg, :avatar])
    end
end
