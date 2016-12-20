class ContatoSite < ApplicationMailer
  def send_email(text,email,nome,telefone)
    @texto = text
    @nome = nome
    @telefone = telefone
    mail(to: email, subject: 'Contato Site', from: 'grupolpgomes@gmail.com')
  end

end
