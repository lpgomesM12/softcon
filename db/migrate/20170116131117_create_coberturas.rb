class CreateCoberturas < ActiveRecord::Migration
  def change
    create_table :coberturas do |t|
      t.string :nome_cobertura
      t.references :condominio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
