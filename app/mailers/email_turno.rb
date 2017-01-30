class EmailTurno < ApplicationMailer
  def send_email(email,turno,email_condominio)
    @turno = turno
    mail(to: email, subject: 'Turno', from: email_condominio)
  end
end
