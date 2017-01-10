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


     @nome = params[:nome]
     @email = params[:email]
     @telefone = params[:telefone]
     @duvida = params[:duvida]

     ContatoSite.send_email(@nome,@email,@telefone,@duvida).deliver

     render :json => true

  end
end
