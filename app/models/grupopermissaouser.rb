class Grupopermissaouser < ActiveRecord::Base
  belongs_to :user
  belongs_to :grupopermissao
  belongs_to :condominio
end
