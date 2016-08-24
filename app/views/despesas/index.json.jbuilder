json.array!(@despesas) do |despesa|
  json.extract! despesa, :id, :valr_despesa, :numr_qtdparcela, :condominio_id, :prestador_id
  json.url despesa_url(despesa, format: :json)
end
