json.array!(@grupopermissaos) do |grupopermissao|
  json.extract! grupopermissao, :id, :nome
  json.url grupopermissao_url(grupopermissao, format: :json)
end
