class CreateTiporeservas < ActiveRecord::Migration
  def change
    create_table :tiporeservas do |t|
      t.string :desc_tiporeserva

      t.timestamps null: false
    end
  end
end
