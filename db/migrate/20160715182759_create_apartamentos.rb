class CreateApartamentos < ActiveRecord::Migration
  def change
    create_table :apartamentos do |t|
      t.string :numr_apartamento
      t.string :numr_bloco
      t.references :condominio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
