class Pessoacondominio < ActiveRecord::Base
  belongs_to :condominio
  belongs_to :pessoa

  accepts_nested_attributes_for :pessoa

end
