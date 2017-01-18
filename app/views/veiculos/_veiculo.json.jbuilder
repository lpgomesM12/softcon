json.extract! veiculo, :id, :desc_placa, :desc_veiculo, :pessoa_id, :condominio_id, :created_at, :updated_at
json.url veiculo_url(veiculo, format: :json)