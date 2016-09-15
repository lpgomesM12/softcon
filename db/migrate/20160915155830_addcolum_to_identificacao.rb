class AddcolumToIdentificacao < ActiveRecord::Migration
  def change
    add_reference :identificacaos, :condominio, index: true, foreign_key: true
  end
end
