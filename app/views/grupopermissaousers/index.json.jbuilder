json.array!(@grupopermissaousers) do |grupopermissaouser|
  json.extract! grupopermissaouser, :id, :user_id, :grupopermissao_id
  json.url grupopermissaouser_url(grupopermissaouser, format: :json)
end
