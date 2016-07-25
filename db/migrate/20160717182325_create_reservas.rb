class CreateReservas < ActiveRecord::Migration
  def change
    create_table :reservas do |t|
      t.datetime :data_reserva
      t.string :hora_inicio
      t.string :hora_fim
      t.references :tiporeserva, index: true, foreign_key: true
      t.datetime :data_cancelamento
      t.references :apartamento, index: true, foreign_key: true
      t.decimal :valr_reserva
      t.boolean :flag_autorizado
      t.string :nome_solicitante
      t.string :email_solicitante
      t.references :condominio, index: true, foreign_key: true
      t.datetime :data_autorizacao
      t.integer :user_inclusao, :integer, :references => :User, index: true
      t.integer :user_cancelamento, :integer, :references => :User, index: true
      t.integer :user_autorizacao, :integer, :references => :User, index: true

      t.timestamps null: false
    end
  end
end
