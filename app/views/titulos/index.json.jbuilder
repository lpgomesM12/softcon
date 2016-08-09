json.array!(@titulos) do |titulo|
  json.extract! titulo, :id, :desc_titulo, :numr_tipolancamento, :data_cancelamento
  json.url titulo_url(titulo, format: :json)
end
