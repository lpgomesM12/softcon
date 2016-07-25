class AddCondominioRefToGrupopermissaouser < ActiveRecord::Migration
  def change
    add_reference :grupopermissaousers, :condominio, index: true, foreign_key: true
  end
end
