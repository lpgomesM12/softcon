class Tiporeservacondominio < ActiveRecord::Base
  belongs_to :tiporeserva
  belongs_to :condominio
end
