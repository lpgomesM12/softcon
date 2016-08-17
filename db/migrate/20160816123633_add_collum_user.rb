class AddCollumUser < ActiveRecord::Migration
  def change
    add_column :users, :flag_exclusao, :boolean
    add_column :users, :user_exclusao, :integer, :references => :User, index: true
  end
end
