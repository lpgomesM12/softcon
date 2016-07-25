class CreateUsercondominios < ActiveRecord::Migration
  def change
    create_table :usercondominios do |t|
      t.references :user, index: true, foreign_key: true
      t.references :funcao, index: true, foreign_key: true
      t.references :condominio, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
