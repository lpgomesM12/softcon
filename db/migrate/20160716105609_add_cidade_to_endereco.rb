class AddCidadeToEndereco < ActiveRecord::Migration
  def change
    add_reference :enderecos, :cidade, index: true, foreign_key: true
  end
end
