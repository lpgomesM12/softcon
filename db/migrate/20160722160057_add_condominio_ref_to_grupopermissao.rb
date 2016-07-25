class AddCondominioRefToGrupopermissao < ActiveRecord::Migration
  def change
    add_reference :grupopermissaos, :grupopermissao, index: true, foreign_key: true
  end
end
