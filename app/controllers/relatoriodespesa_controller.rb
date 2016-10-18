class RelatoriodespesaController < ApplicationController

  def relatorio

      if params[:data_inicio] == "" or params[:data_inicio] == nil
          @data_inicio = Date.today.at_beginning_of_month.strftime('%d/%m/%Y')
          @data_fim  = Date.today.at_end_of_month.strftime('%d/%m/%Y')
          else
          @data_inicio = params[:data_inicio]
          @data_fim = params[:data_fim]
        end

        # debugger

        if params[:flag_pago] == "on"
          @flag_pago = true
        else
          @flag_pago = false
        end
        if params[:flag_naopago] == "on"
           @flag_naopago = true
         else
           @flag_naopago = false
        end

        if params[:flag_despesafixa] == "on"
          @despesa_fixa = true
        else
          @despesa_fixa = false
        end
        if params[:flag_ordinaria] == "on"
          @despesa_ordinaria = true
        else
          @despesa_ordinaria = false
        end

        @condominio = current_user.condominio.nome_condominio

        @dividas = Divida.busca_dividas(current_user.condominio_id,
                                        params[:flag_pago],
                                        params[:flag_naopago],
                                        params[:flag_despesafixa],
                                        params[:flag_ordinaria],
                                        Date.strptime(@data_inicio, "%d/%m/%Y").strftime('%Y-%m-%d'),
                                        Date.strptime(@data_fim, "%d/%m/%Y").strftime('%Y-%m-%d'))
        # @total_divida = @dividas.to_a.sum(&:valr_divida)
        @date = Time.zone.now.strftime('%Y-%m-%d')
        @data_emissao = Time.zone.now.strftime('%d-%m-%Y')
        @total_paga = @dividas.where(flag_pago: true).to_a.sum(&:valr_divida)
        @total_naopaga = @dividas.where(flag_pago: false).to_a.sum(&:valr_divida)
        @total_atraso = @dividas.where("flag_pago = false AND data_vencimento <= '#{@date}'").to_a.sum(&:valr_divida)
        @total_lancado = @dividas.to_a.sum(&:valr_divida)

        respond_to do |format|
          format.html
          format.pdf {
            render pdf: "reserva",
            orientation: "Landscape",
          header: {center: "Cadastro de Despesas"},
          footer: { center: "[page] de [topage]" }
          }
        end

      end

end
