class AddcondominioToMorador < ActiveRecord::Migration
  def change
    add_reference :moradors, :condominio, index: true, foreign_key: true
  end
end
