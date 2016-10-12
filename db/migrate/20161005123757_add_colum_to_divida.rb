class AddColumToDivida < ActiveRecord::Migration
  def change
    add_reference :dividas, :despesa, index: true, foreign_key: true
  end
end
