json.array!(@usercondominios) do |usercondominio|
  json.extract! usercondominio, :id, :user_id, :funcao_id, :condominio_id
  json.url usercondominio_url(usercondominio, format: :json)
end
