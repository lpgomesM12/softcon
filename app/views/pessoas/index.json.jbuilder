json.array!(@pessoas) do |pessoa|
  json.extract! pessoa, :id, :nome_pessoa, :desc_fone, :cpf, :rg
  json.url pessoa_url(pessoa, format: :json)
end
