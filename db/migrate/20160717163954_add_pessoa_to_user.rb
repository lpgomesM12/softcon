class AddPessoaToUser < ActiveRecord::Migration
  def change
    add_reference :users, :pessoa, index: true, foreign_key: true
  end
end
