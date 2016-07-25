class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas do |t|
      t.string :nome_pessoa
      t.string :desc_fone
      t.string :cpf
      t.string :rg

      t.timestamps null: false
    end
  end
end
