class Despesa < ActiveRecord::Base
  belongs_to :condominio
  belongs_to :prestador
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao"
  belongs_to :item, :class_name => "User", :foreign_key => "item_id"
  belongs_to :subitem, :class_name => "User", :foreign_key => "subitem_id"
end
