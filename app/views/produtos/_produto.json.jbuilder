json.extract! produto, :id, :nome_produto, :desc_produto, :created_at, :updated_at
json.url produto_url(produto, format: :json)