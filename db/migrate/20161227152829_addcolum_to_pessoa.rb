class AddcolumToPessoa < ActiveRecord::Migration
  def change
    add_column :pessoas, :numr_idbiometrico, :integer
  end
end
