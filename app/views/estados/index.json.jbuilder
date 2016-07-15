json.array!(@estados) do |estado|
  json.extract! estado, :id, :nome_estado, :sigl_estado, :flag_ativo
  json.url estado_url(estado, format: :json)
end
