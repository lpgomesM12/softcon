class CreatePessoacondominios < ActiveRecord::Migration
  def change
    create_table :pessoacondominios do |t|
      t.references :condominio, index: true, foreign_key: true
      t.references :pessoa, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
