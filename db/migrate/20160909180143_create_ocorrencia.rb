class CreateOcorrencia < ActiveRecord::Migration
  def change
    create_table :ocorrencia do |t|
      t.string :desc_ocorrencia
      t.datetime :data_saida
      t.integer :qdt_minutos
      t.references :identificacao, index: true, foreign_key: true
      t.integer :user_inclusao, :integer, :references => :User, index: true

      t.timestamps null: false
    end
  end
end
