class CreateDividas < ActiveRecord::Migration
  def change
    create_table :dividas do |t|
      t.integer :numr_tipodivida
      t.integer :numr_cheque
      t.datetime :data_vencimento
      t.decimal :valr_divida
      t.string :desc_observacao
      t.integer :numg_tipopagamento
      t.datetime :data_cadastro
      t.string :desc_docprincipal
      t.datetime :data_cancelamento
      t.datetime :data_pagamento
      t.decimal :valr_pagamento
      t.decimal :valr_multa
      t.decimal :valr_juro
      t.integer :numr_notafiscal
      t.integer :numr_parcela
      t.integer :desc_caminhocheque
      t.boolean :flag_ordinaria
      t.boolean :flag_despesafixa
      t.references :condominio, index: true, foreign_key: true
      t.references :contabank, index: true, foreign_key: true
      t.references :prestador, index: true, foreign_key: true
      t.integer :user_inclusao, :integer, :references => :User, index: true
      t.integer :user_exclusao, :integer, :references => :User, index: true


      t.timestamps null: false
    end
  end
end
