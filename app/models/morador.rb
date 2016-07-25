class Morador < ActiveRecord::Base
  belongs_to :apartamento
  belongs_to :pessoa

  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"

end
