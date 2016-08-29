class CreateTipotermos < ActiveRecord::Migration
  def change
    create_table :tipotermos do |t|
      t.string :nome_tipotermo
      t.string :desc_tipotermo

      t.timestamps null: false
    end
  end
end
