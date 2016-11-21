class Mural < ActiveRecord::Base
  belongs_to :condominio

  has_attached_file :pdf, styles: {thumbnail: "60x60#"}
  validates_attachment :pdf, content_type: { content_type: "application/pdf" }
end
