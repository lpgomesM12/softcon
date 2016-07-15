json.array!(@condominios) do |condominio|
  json.extract! condominio, :id, :nome_condominio, :data_cancelamento, :email, :endereco_id
  json.url condominio_url(condominio, format: :json)
end
