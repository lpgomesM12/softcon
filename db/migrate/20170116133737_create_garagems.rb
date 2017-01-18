class CreateGaragems < ActiveRecord::Migration
  def change
    create_table :garagems do |t|
      t.string :numr_garagem
      t.references :cobertura, index: true, foreign_key: true
      t.references :condominio, index: true, foreign_key: true
      t.references :apartamento, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
