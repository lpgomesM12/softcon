json.array!(@dividas) do |divida|
  json.extract! divida, :id, :numr_tipodivida, :numr_cheque, :data_vencimento, :valr_divida, :desc_observacao, :numg_tipopagamento, :data_cadastro, :desc_docprincipal, :data_cancelamento, :data_pagamento, :valr_pagamento, :valr_multa, :valr_juro, :numr_notafiscal, :numr_parcela, :desc_caminhocheque, :flag_ordinaria, :flag_despesafixa, :condominio_id, :contabank_id, :prestador_id
  json.url divida_url(divida, format: :json)
end
