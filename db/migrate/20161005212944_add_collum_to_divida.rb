class AddCollumToDivida < ActiveRecord::Migration
  def change
    add_column :dividas, :flag_pago, :boolean
  end
end
