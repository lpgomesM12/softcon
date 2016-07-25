class AddmotivoToReserva < ActiveRecord::Migration
  def change
    add_column :reservas, :desc_motivocancelamento, :string
  end
end
