class Divida < ActiveRecord::Base
  belongs_to :condominio
  belongs_to :contabank
  belongs_to :prestador
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao"
  belongs_to :cancelamento, :class_name => "User", :foreign_key => "user_cancelamento"


end
