class RelatorioController < ApplicationController
  def reserva
  end

  def reservas

    if params[:data_inicio] == "" or params[:data_inicio] == nil
        @data_inicio = Date.today.at_beginning_of_month.strftime('%d/%m/%Y')
        @data_fim  = Date.today.at_end_of_month.strftime('%d/%m/%Y')
      else
        @data_inicio = params[:data_inicio]
        @data_fim = params[:data_fim]
    end

    @reservas = Reserva.where(condominio_id: current_user.condominio_id, data_reserva: @data_inicio.gsub("/","-")..@data_fim.gsub("/","-") )
    @condominio = current_user.condominio.nome_condominio


    respond_to do |format|
      format.html
      format.pdf { render pdf: "reserva",
        header: {center: "Relatório de Reservas"},
        footer: { center: "[page] de [topage]" }
        }
    end
    #@reservas = Reserva.where(condominio_id: current_user.condominio_id, flag_autorizado: false, user_cancelamento: nil )
  end

  def index
      @articles = ["Article 1", "Article 2", "Article 3", "Article 4", "Article 4", "Article 4", "Article 4", "Article 4", "Article 4", "Article 4", "Article 4", "Article 4", "Article 4"]
      respond_to do |format|
        format.html

        format.pdf { render pdf: "articles-list-report",
          header: {center: "COMPANY NAME"},
          footer: { center: "[page] de [topage]"}
          }
      end
  end

end
