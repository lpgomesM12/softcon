class Endereco < ActiveRecord::Base
  belongs_to :bairro
  belongs_to :cidade
end
