class Veiculo < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :condominio
end
