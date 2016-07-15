class CreateFuncaos < ActiveRecord::Migration
  def change
    create_table :funcaos do |t|
      t.string :desc_funcao

      t.timestamps null: false
    end
  end
end
