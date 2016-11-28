class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nome_empresa
      t.string :cnpj
      t.string :descricao
      t.references :endereco, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
