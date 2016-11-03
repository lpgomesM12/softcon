json.array!(@agendamentomudancas) do |agendamentomudanca|
  json.extract! agendamentomudanca, :id, :nome, :fone, :apartamento_id, :data_agendamento, :valr_taxa, :periodo, :flag_entrada, :flag_saida, :observacao, :condominio_id
  json.url agendamentomudanca_url(agendamentomudanca, format: :json)
end
