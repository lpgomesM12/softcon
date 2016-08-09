json.array!(@contabanks) do |contabank|
  json.extract! contabank, :id, :numr_agencia, :numr_conta, :nome_banco, :situacao, :condominio_id
  json.url contabank_url(contabank, format: :json)
end
