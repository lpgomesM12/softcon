class CreatePessoaautorizadas < ActiveRecord::Migration
  def change
    create_table :pessoaautorizadas do |t|
      t.references :identificacao, index: true, foreign_key: true
      t.boolean :flag_pessoaautorizada
      t.boolean :flag_pessoabloqueada
      t.string :desc_atribuicao
      t.boolean :flag_todasemana
      t.boolean :flag_segunda
      t.boolean :flag_terca
      t.boolean :flag_quarta
      t.boolean :flag_quinta
      t.boolean :flag_sexta
      t.boolean :flag_sabado
      t.boolean :flag_domingo
      t.boolean :flag_periodo
      t.datetime :data_periodoinicio
      t.datetime :data_periodofim
      t.boolean :flag_nestadata
      t.datetime :data_nessadata
      t.integer :numr_horainicio
      t.integer :numr_horafim
      t.references :condominio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
