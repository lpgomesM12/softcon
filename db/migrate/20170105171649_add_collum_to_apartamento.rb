class AddCollumToApartamento < ActiveRecord::Migration
  def change
    add_reference :apartamentos, :pessoa, index: true, foreign_key: true
  end
end
