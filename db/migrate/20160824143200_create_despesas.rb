class CreateDespesas < ActiveRecord::Migration
  def change
    create_table :despesas do |t|
      t.decimal :valr_despesa
      t.integer :numr_qtdparcela
      t.references :condominio, index: true, foreign_key: true
      t.references :prestador, index: true, foreign_key: true
      t.integer :user_inclusao, :integer, :references => :User, index: true
      t.integer :user_exclusao, :integer, :references => :User, index: true
      t.integer :item_id, :integer, :references => :Titulo, index: true
      t.integer :subitem_id, :integer, :references => :Titulo, index: true

      t.timestamps null: false
    end
  end
end
