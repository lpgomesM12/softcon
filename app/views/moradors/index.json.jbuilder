json.array!(@moradors) do |morador|
  json.extract! morador, :id, :apartamento_id, :pessoa_id
  json.url morador_url(morador, format: :json)
end
