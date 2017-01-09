class AddcolumToMural < ActiveRecord::Migration
  def change
    add_reference :murals, :categoriamural, index: true, foreign_key: true
  end
end
