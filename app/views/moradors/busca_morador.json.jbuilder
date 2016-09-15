json.array!(@moradors) do |result|
json.id result.id
json.value result.pessoa.nome_pessoa
end
