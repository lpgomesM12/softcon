class Prestador < ActiveRecord::Base
  belongs_to :categoriaprestador
  belongs_to :condominio
  has_many :contatoprestadors, dependent: :destroy
  accepts_nested_attributes_for :contatoprestadors, allow_destroy: true

  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"

  TIPOCONTATO = %w[Celular Email]

end
