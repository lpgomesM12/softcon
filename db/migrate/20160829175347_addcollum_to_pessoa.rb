class AddcollumToPessoa < ActiveRecord::Migration
  def change
    add_column :pessoas, :email_pessoa, :string
  end
end
