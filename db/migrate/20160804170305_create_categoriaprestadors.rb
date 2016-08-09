class CreateCategoriaprestadors < ActiveRecord::Migration
  def change
    create_table :categoriaprestadors do |t|
      t.string :nome_categoria

      t.timestamps null: false
    end
  end
end
