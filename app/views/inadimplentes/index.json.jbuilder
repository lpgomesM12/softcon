json.array!(@inadimplentes) do |inadimplente|
  json.extract! inadimplente, :id, :apartamento_id
  json.url inadimplente_url(inadimplente, format: :json)
end
