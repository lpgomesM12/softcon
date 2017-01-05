class ReservaAprovada < ApplicationMailer
  def send_email(reserva,email,email_condominio)
    @reserva = reserva
    mail(to: email, subject: 'Solicitação de reserva APROVADA', from: email_condominio)
  end
end
