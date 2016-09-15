class Ocorrencium < ActiveRecord::Base
  belongs_to :identificacao
  belongs_to :apartamento
  belongs_to :condominio
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"

  accepts_nested_attributes_for :identificacao
end
