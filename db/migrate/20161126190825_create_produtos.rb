class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.string :nome_produto
      t.string :desc_produto

      t.timestamps null: false
    end
  end
end
