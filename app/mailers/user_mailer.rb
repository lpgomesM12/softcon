class UserMailer < ApplicationMailer

 default from: "softconsuporte@hotmail.com"

  def send_email(user,pessoa)
    @user = user
    @pessoa = pessoa
    mail(to: email, subject: 'Dados de cadastro')
  end
end
