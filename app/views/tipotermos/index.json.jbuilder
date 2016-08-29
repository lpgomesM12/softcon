json.array!(@tipotermos) do |tipotermo|
  json.extract! tipotermo, :id, :nome_tipotermo, :desc_tipotermo
  json.url tipotermo_url(tipotermo, format: :json)
end
