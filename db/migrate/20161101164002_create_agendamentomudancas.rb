class CreateAgendamentomudancas < ActiveRecord::Migration
  def change
    create_table :agendamentomudancas do |t|
      t.string :nome
      t.string :fone
      t.references :apartamento, index: true, foreign_key: true
      t.datetime :data_agendamento
      t.decimal :valr_taxa
      t.string :periodo
      t.boolean :flag_entrada
      t.boolean :flag_saida
      t.string :observacao
      t.references :condominio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
