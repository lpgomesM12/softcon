class CreateContatoprestadors < ActiveRecord::Migration
  def change
    create_table :contatoprestadors do |t|
      t.string :desc_tipocontado
      t.string :desc_contato
      t.references :prestador, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
