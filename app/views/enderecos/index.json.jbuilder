json.array!(@enderecos) do |endereco|
  json.extract! endereco, :id, :desc_endereco, :desc_cep, :bairro_id
  json.url endereco_url(endereco, format: :json)
end
