class PrevisaoorcamentariaController < ApplicationController

  def index

   @dividas = Divida.select('despesas.item_id, titulos.desc_titulo, sum(dividas.valr_divida) as  valr_divida, titulos.numr_tipolancamento as  numr_tipolancamento').joins('
                  INNER JOIN despesas ON despesas.id = despesa_id
                  INNER JOIN titulos ON titulos.id = despesas.item_id').group('
                  despesas.item_id, titulos.numr_tipolancamento, titulos.desc_titulo'
                  ).having("numr_tipolancamento = '1'")

   @subtitulos = Divida.select('despesas.subitem_id, ti.desc_titulo as item, titulos.desc_titulo as subitem, count(despesas.subitem_id) as qtd, despesas.item_id as item_id').joins('
                  INNER JOIN despesas ON despesas.id = despesa_id
                  INNER JOIN titulos ON titulos.id = despesas.subitem_id
                  INNER JOIN titulos ti on  ti.id = despesas.item_id').group('
                  despesas.subitem_id, titulos.desc_titulo, ti.desc_titulo, despesas.item_id')

  end

  def busca_dividasubitem

      detalhes = Divida.joins('INNER JOIN despesas ON despesas.id = despesa_id
                              ').where('despesas.subitem_id = ? AND despesas.item_id = ?',params[:subitem_id], params[:item_id])

      detalhes_json = detalhes.map {|item| {:id => item.id,
                                            :nome_prestador => item.prestador.nome_prestador,
                                            :desc_observacao => item.desc_observacao == nil ? '' :item.desc_observacao,
                                            :numr_cheque => item.numr_cheque,
                                            :numr_notafiscal => item.numr_notafiscal,
                                            :data_vencimento => item.data_vencimento.blank? ? '' : item.data_vencimento.strftime("%d/%m/%Y"),
                                            :valr_divida => item.valr_divida,
                                            :data_pagamento => item.data_pagamento.blank? ? '' : item.data_pagamento.strftime("%d/%m/%Y"),
                                            :valr_pagamento => item.valr_pagamento == nil ? '' : item.valr_pagamento}}

      render :json => detalhes_json
end


def relatorio

  @subtitulos = Divida.select('despesas.subitem_id, ti.desc_titulo as item, titulos.desc_titulo as subitem, sum(dividas.valr_divida) as valr_divida , despesas.item_id as item_id').joins('
                  INNER JOIN despesas ON despesas.id = despesa_id
                  INNER JOIN titulos ON titulos.id = despesas.subitem_id
                  INNER JOIN titulos ti on  ti.id = despesas.item_id').group('
                  despesas.subitem_id, titulos.desc_titulo, ti.desc_titulo, despesas.item_id')


   @condominio = current_user.condominio.nome_condominio
    respond_to do |format|
      format.html
      format.pdf {
        render pdf: "reserva",
        footer: { center: "[page] de [topage]" }
      }
    end

end


end
