class AddCollumToPessoaautorizada < ActiveRecord::Migration
  def change
    add_reference :pessoaautorizadas, :apartamento, index: true, foreign_key: true
  end
end
