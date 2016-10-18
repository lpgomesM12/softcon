class CreateInadimplentes < ActiveRecord::Migration
  def change
    create_table :inadimplentes do |t|
      t.references :apartamento, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
