class RelatorioacessoController < ApplicationController

  def relatorio

    if params[:data_inicio] == "" or params[:data_inicio] == nil
        @data_inicio = Date.today.at_beginning_of_month.strftime('%d/%m/%Y')
        @data_fim  = Date.today.at_end_of_month.strftime('%d/%m/%Y')

      else
        @data_inicio = params[:data_inicio]
        @data_fim = params[:data_fim]
    end

    @tipoocorrencia = params[:tipoocorrencia_id]
    @apartamento = params[:apartamento_id]
    @condominio = current_user.condominio.nome_condominio


     @acessos = Ocorrencium.where(tipoocorrencium_id: @tipoocorrencia,
                                  created_at: Date.strptime(@data_inicio, "%d/%m/%Y").strftime('%Y-%m-%d')..Date.strptime(@data_fim, "%d/%m/%Y").strftime('%Y-%m-%d'),
                                  apartamento_id: @apartamento)

          respond_to do |format|
            format.html
            format.pdf {
              render pdf: "reserva",
              orientation: "Landscape",
            header: {center: "Controle de Acesso"},
            footer: { center: "[page] de [topage]" }
            }
          end
  end



end
