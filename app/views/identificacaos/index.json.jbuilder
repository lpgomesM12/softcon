json.array!(@identificacaos) do |identificacao|
  json.extract! identificacao, :id, :desc_identificador, :desc_nome, :desc_fone, :desc_atividade, :apartamento_id
  json.url identificacao_url(identificacao, format: :json)
end
