class AddcolumToOcorrencium < ActiveRecord::Migration
  def change
    add_reference :ocorrencia, :condominio, index: true, foreign_key: true
  end
end
