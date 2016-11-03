json.array!(@achadoperdidos) do |achadoperdido|
  json.extract! achadoperdido, :id, :descricao, :data_achado, :data_entrega, :observacao, :morador_id
  json.url achadoperdido_url(achadoperdido, format: :json)
end
