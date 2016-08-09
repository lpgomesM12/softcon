json.array!(@categoriaprestadors) do |categoriaprestador|
  json.extract! categoriaprestador, :id, :nome_categoria
  json.url categoriaprestador_url(categoriaprestador, format: :json)
end
