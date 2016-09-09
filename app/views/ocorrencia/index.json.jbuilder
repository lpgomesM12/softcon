json.array!(@ocorrencia) do |ocorrencium|
  json.extract! ocorrencium, :id, :data_ocorrencia, :desc_ocorrencia, :data_saida, :qdt_minutos, :identificacao_id
  json.url ocorrencium_url(ocorrencium, format: :json)
end
