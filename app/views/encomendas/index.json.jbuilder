json.array!(@encomendas) do |encomenda|
  json.extract! encomenda, :id, :msg_encomenda, :data_encomenda, :data_entrega, :condominio_id, :morador_id
  json.url encomenda_url(encomenda, format: :json)
end
