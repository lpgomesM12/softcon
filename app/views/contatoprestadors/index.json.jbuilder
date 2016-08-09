json.array!(@contatoprestadors) do |contatoprestador|
  json.extract! contatoprestador, :id, :desc_tipocontado, :desc_contato, :prestador_id
  json.url contatoprestador_url(contatoprestador, format: :json)
end
