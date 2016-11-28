json.extract! empresa, :id, :nome_empresa, :cnpj, :descricao, :endereco_id, :created_at, :updated_at
json.url empresa_url(empresa, format: :json)