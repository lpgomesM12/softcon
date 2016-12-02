json.extract! turno, :id, :desc_relatorio, :data_entrega, :user_id, :flag_entregue, :created_at, :updated_at
json.url turno_url(turno, format: :json)