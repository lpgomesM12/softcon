class Termo < ActiveRecord::Base
  belongs_to :tipotermo
  belongs_to :condominio
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"

end
