class CreateGrupopermissaos < ActiveRecord::Migration
  def change
    create_table :grupopermissaos do |t|
      t.string :nome

      t.timestamps null: false
    end
  end
end
