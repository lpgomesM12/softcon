class CreateCategoriamurals < ActiveRecord::Migration
  def change
    create_table :categoriamurals do |t|
      t.string :nome_categoria
      t.references :condominio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
