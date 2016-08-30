class EncomendaInfo < ApplicationMailer

  def send_email(encomenda,email,email_condominio)
    @encomenda = encomenda
    mail(to: email, subject: 'Aviso de encomenda', from: email_condominio)
  end

end
