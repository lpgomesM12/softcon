class CreateEncomendas < ActiveRecord::Migration
  def change
    create_table :encomendas do |t|
      t.string :msg_encomenda
      t.datetime :data_encomenda
      t.datetime :data_entrega
      t.references :condominio, index: true, foreign_key: true
      t.references :morador, index: true, foreign_key: true
      t.integer :user_inclusao, :integer, :references => :User, index: true
      t.integer :user_entrega, :integer, :references => :User, index: true

      t.timestamps null: false
    end
  end
end
