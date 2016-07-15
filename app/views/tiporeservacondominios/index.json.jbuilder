json.array!(@tiporeservacondominios) do |tiporeservacondominio|
  json.extract! tiporeservacondominio, :id, :tiporeserva_id, :condominio_id
  json.url tiporeservacondominio_url(tiporeservacondominio, format: :json)
end
