class ReservaNegada < ApplicationMailer

  default from: 'softconcomercial@hotmail.com'
   def send_email(reserva,email)
     @reserva = reserva
     mail(to: email, subject: 'Solicitação de reserva NEGADA')
   end
end
