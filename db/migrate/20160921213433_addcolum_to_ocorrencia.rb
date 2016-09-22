class AddcolumToOcorrencia < ActiveRecord::Migration
  def change
    add_column :ocorrencia, :user_baixa, :integer, :references => :User, index: true
  end
end
