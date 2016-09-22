class AddcolunsToDivida < ActiveRecord::Migration
  def change
    add_column :dividas, :data_exclusao, :datetime
    add_column :dividas, :user_cancelamento, :integer, :references => :User, index: true
  end
end
