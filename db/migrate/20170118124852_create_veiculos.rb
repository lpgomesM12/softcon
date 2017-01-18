class CreateVeiculos < ActiveRecord::Migration
  def change
    create_table :veiculos do |t|
      t.string :desc_placa
      t.string :desc_veiculo
      t.references :pessoa, index: true, foreign_key: true
      t.references :condominio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
