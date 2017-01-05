class AddcollumToTurno < ActiveRecord::Migration
  def change
    add_reference :turnos, :condominio, index: true, foreign_key: true
  end
end
