class Encomenda < ActiveRecord::Base
  belongs_to :condominio
  belongs_to :morador
  validates :morador_id, :presence => { :message => 'Escolha um morador' }

  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"
  belongs_to :entrega, :class_name => "User", :foreign_key => "user_entrega"

end
