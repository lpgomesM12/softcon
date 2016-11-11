class Pessoaautorizada < ActiveRecord::Base
  belongs_to :identificacao
  belongs_to :condominio
  belongs_to :apartamento

  accepts_nested_attributes_for :identificacao
end
