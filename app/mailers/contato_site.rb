class ContatoSite < ApplicationMailer
  def send_email(nome,email,telefone,duvida)
    @nome = nome
    @email = email
    @telefone =  telefone
    @duvida = duvida
    mail(to: email, subject: 'Contato Site', from: 'softconcomercial@hotmail.com')
  end

end
