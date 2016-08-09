json.array!(@prestadors) do |prestador|
  json.extract! prestador, :id, :desc_cpfcnpj, :nome_prestador, :nome_responsavel, :observacao, :categoriaprestador_id, :condominio_id
  json.url prestador_url(prestador, format: :json)
end
