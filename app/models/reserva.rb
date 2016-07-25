class Reserva < ActiveRecord::Base
  belongs_to :tiporeserva
  belongs_to :apartamento
  belongs_to :condominio

  belongs_to :userinclusao, :class_name => "User", :foreign_key => "user_inclusao"
  belongs_to :usercancelamento, :class_name => "User", :foreign_key => "user_cancelamento"
  belongs_to :userautorizacao, :class_name => "User", :foreign_key => "user_autorizacao"

end
