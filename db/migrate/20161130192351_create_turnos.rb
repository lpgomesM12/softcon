class CreateTurnos < ActiveRecord::Migration
  def change
    create_table :turnos do |t|
      t.text :desc_relatorio
      t.datetime :data_entrega
      t.references :user, index: true, foreign_key: true
      t.boolean :flag_entregue

      t.timestamps null: false
    end
  end
end
