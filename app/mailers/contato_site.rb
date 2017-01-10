class ContatoSite < ApplicationMailer
  def send_email(nome,email,telefone,duvida)
    @nome = nome
    @email = email
    @telefone =  telefone
    @duvida = duvida
    mail(to: 'softconcomercial@hotmail.com', subject: 'Contato Site', from: email)
  end

end
