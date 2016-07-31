class Email < ApplicationMailer

  default from: 'grupolpgomes@gmail.com'
    def welcome_email(user)
      @reserva = user
      @url  = 'http://example.com/login'
      mail(to: @reserva.email_solicitante, subject: 'O email está funcionando')
    end
end
