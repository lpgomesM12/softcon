json.array!(@termos) do |termo|
  json.extract! termo, :id, :nome_termo, :text_termo, :tipotermo_id, :condominio_id
  json.url termo_url(termo, format: :json)
end
