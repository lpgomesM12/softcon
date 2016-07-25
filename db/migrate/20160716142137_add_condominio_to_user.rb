class AddCondominioToUser < ActiveRecord::Migration
  def change
    add_reference :users, :condominio, index: true, foreign_key: true
  end
end
