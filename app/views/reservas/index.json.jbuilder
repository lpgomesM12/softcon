json.array!(@reservas) do |reserva|
  json.extract! reserva, :id, :data_reserva, :hora_inicio, :hora_fim, :tiporeserva_id, :data_cancelamento, :apartamento_id, :valr_reserva, :flag_autorizado, :nome_solicitante, :email_solicitante, :condominio_id, :data_autorizacao
  json.url reserva_url(reserva, format: :json)
end
