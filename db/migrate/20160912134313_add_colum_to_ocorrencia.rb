class AddColumToOcorrencia < ActiveRecord::Migration
  def change
    add_reference :ocorrencia, :tipoocorrencium, index: true, foreign_key: true
  end
end
