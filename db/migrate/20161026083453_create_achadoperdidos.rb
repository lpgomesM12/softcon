class CreateAchadoperdidos < ActiveRecord::Migration
  def change
    create_table :achadoperdidos do |t|
      t.string :descricao
      t.datetime :data_achado
      t.datetime :data_entrega
      t.string :observacao
      t.references :morador, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
