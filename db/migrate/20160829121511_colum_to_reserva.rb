class ColumToReserva < ActiveRecord::Migration

    def change
      add_reference :reservas, :termo, index: true, foreign_key: true
      add_column :reservas, :flag_termoaceito, :boolean
    end
end
