json.array!(@funcaos) do |funcao|
  json.extract! funcao, :id, :desc_funcao
  json.url funcao_url(funcao, format: :json)
end
