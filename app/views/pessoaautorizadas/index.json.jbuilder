json.array!(@pessoaautorizadas) do |pessoaautorizada|
  json.extract! pessoaautorizada, :id, :identificacao_id, :flag_pessoaautorizada, :flag_pessoabloqueada, :desc_atribuicao, :flag_todasemana, :flag_segunda, :flag_terca, :flag_quarta, :flag_quinta, :flag_sexta, :flag_sabado, :flag_domingo, :flag_periodo, :data_periodoinicio, :data_periodofim, :flag_nestadata, :data_nessadata, :numr_horainicio, :numr_horafim, :condominio_id
  json.url pessoaautorizada_url(pessoaautorizada, format: :json)
end
