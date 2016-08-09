class CreatePrestadors < ActiveRecord::Migration
  def change
    create_table :prestadors do |t|
      t.string :desc_cpfcnpj
      t.string :nome_prestador
      t.string :nome_responsavel
      t.string :observacao
      t.references :categoriaprestador, index: true, foreign_key: true
      t.references :condominio, index: true, foreign_key: true
      t.integer :user_inclusao, :integer, :references => :User, index: true

      t.timestamps null: false
    end
  end
end
