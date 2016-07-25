class CreateGrupopermissaousers < ActiveRecord::Migration
  def change
    create_table :grupopermissaousers do |t|
      t.references :user, index: true, foreign_key: true
      t.references :grupopermissao, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
