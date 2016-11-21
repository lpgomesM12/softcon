class CreateMurals < ActiveRecord::Migration
  def change
    create_table :murals do |t|
      t.string :titulo
      t.string :descricao
      t.references :condominio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
