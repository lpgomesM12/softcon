class CreateCondominios < ActiveRecord::Migration
  def change
    create_table :condominios do |t|
      t.string :nome_condominio
      t.datetime :data_cancelamento
      t.string :email
      t.references :endereco, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
