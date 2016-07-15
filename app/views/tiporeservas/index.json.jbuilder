json.array!(@tiporeservas) do |tiporeserva|
  json.extract! tiporeserva, :id, :desc_tiporeserva
  json.url tiporeserva_url(tiporeserva, format: :json)
end
