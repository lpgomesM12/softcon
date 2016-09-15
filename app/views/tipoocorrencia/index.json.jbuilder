json.array!(@tipoocorrencia) do |tipoocorrencium|
  json.extract! tipoocorrencium, :id, :desc_tipoocorrencia
  json.url tipoocorrencium_url(tipoocorrencium, format: :json)
end
