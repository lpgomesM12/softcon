class CreateTermos < ActiveRecord::Migration
  def change
    create_table :termos do |t|
      t.string :nome_termo
      t.text :text_termo
      t.references :tipotermo, index: true, foreign_key: true
      t.references :condominio, index: true, foreign_key: true
      t.integer :user_inclusao, :integer, :references => :User, index: true

      t.timestamps null: false
    end
  end
end
