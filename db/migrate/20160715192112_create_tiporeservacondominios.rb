class CreateTiporeservacondominios < ActiveRecord::Migration
  def change
    create_table :tiporeservacondominios do |t|
      t.references :tiporeserva, index: true, foreign_key: true
      t.references :condominio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
