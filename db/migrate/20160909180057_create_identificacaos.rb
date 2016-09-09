class CreateIdentificacaos < ActiveRecord::Migration
  def change
    create_table :identificacaos do |t|
      t.string :desc_identificador
      t.string :desc_nome
      t.string :desc_fone
      t.text :desc_atividade
      t.references :apartamento, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
