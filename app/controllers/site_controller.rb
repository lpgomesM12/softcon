class SiteController < ApplicationController

  def index
  end

  def about
  end

  def contato
  end

  def servico
  end

  def envio_email_contato

     @duvida = params[:duvida]
     @nome = params[:nome]
     @email = params[:email]
     @telefone = params[:telefone]

     ContatoSite.send_email(@duvida,@email,@nome,@telefone).deliver

     render :json => true

  end
end
