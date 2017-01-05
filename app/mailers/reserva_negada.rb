class ReservaNegada < ApplicationMailer
   def send_email(reserva,email,email_condominio)
     @reserva = reserva
     mail(to: email, subject: 'Solicitação de reserva NEGADA', from: email_condominio)
   end
end
