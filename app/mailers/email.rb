class Email < ApplicationMailer
  
   default from: 'softconcomercial@hotmail.com'
    def send_email(reserva,email)
      @reserva = reserva
      mail(to: email, subject: 'Solicitação de reserva')
    end
end
