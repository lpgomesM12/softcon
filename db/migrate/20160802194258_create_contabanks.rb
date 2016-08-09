class CreateContabanks < ActiveRecord::Migration
  def change
    create_table :contabanks do |t|
      t.string :numr_agencia
      t.string :numr_conta
      t.string :nome_banco
      t.string :situacao
      t.references :condominio, index: true, foreign_key: true
      t.integer :user_inclusao, :integer, :references => :User, index: true

      t.timestamps null: false
    end
  end
end
