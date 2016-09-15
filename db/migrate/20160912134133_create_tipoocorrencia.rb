class CreateTipoocorrencia < ActiveRecord::Migration
  def change
    create_table :tipoocorrencia do |t|
      t.string :desc_tipoocorrencia

      t.timestamps null: false
    end
  end
end
