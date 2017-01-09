class Categoriamural < ActiveRecord::Base
  belongs_to :condiminio
   has_many :murals
end
