class Garagem < ActiveRecord::Base
  belongs_to :cobertura
  belongs_to :condominio
  belongs_to :apartamento
end
