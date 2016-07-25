class CreateMoradors < ActiveRecord::Migration
  def change
    create_table :moradors do |t|
      t.references :apartamento, index: true, foreign_key: true
      t.references :pessoa, index: true, foreign_key: true
      t.integer :user_inclusao, :integer, :references => :User, index: true

      t.timestamps null: false
    end
  end
end
