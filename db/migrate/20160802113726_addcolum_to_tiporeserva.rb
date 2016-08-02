class AddcolumToTiporeserva < ActiveRecord::Migration
  def change
    add_reference :tiporeservas, :condominio, index: true, foreign_key: true
  end
end
