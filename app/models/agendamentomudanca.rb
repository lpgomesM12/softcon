class Agendamentomudanca < ActiveRecord::Base
  belongs_to :apartamento
  belongs_to :condominio

  PERIODO = %w[Matutino Vespertino Integral]

end
