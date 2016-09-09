class CreateOcorrencia < ActiveRecord::Migration
  def change
    create_table :ocorrencia do |t|
      t.string :data_ocorrencia
      t.string :desc_ocorrencia
      t.string :data_saida
      t.integer :qdt_minutos
      t.references :identificacao, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
