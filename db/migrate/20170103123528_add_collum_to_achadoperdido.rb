class AddCollumToAchadoperdido < ActiveRecord::Migration
  def change
    add_reference :achadoperdidos, :condominio, index: true, foreign_key: true
  end
end
