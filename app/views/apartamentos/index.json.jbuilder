json.array!(@apartamentos) do |apartamento|
  json.extract! apartamento, :id, :numr_apartamento, :numr_bloco, :condominio_id
  json.url apartamento_url(apartamento, format: :json)
end
