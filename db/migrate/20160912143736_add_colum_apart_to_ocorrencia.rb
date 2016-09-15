class AddColumApartToOcorrencia < ActiveRecord::Migration
  def change
    add_reference :ocorrencia, :apartamento, index: true, foreign_key: true
  end
end
