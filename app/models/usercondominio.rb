class Usercondominio < ActiveRecord::Base
  belongs_to :user
  belongs_to :funcao
  belongs_to :condominio
end
