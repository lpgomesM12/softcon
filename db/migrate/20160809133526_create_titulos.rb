class CreateTitulos < ActiveRecord::Migration
  def change
    create_table :titulos do |t|
      t.string :desc_titulo
      t.string :numr_tipolancamento
      t.datetime :data_cancelamento

      t.timestamps null: false
    end
  end
end
