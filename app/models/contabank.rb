class Contabank < ActiveRecord::Base
  belongs_to :condominio
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"


  SITUACAO = %w[Ativo Inativo]

end
