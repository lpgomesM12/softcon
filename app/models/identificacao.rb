class Identificacao < ActiveRecord::Base
  belongs_to :apartamento
  belongs_to :ocorrencium
  belongs_to :condominio

  validates :desc_nome, presence: { message: "Informe o nome" }
  validates :desc_identificador, presence: { message: "Informe o Identificador" }

  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

end
