class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.string :desc_endereco
      t.string :desc_cep
      t.references :bairro, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
