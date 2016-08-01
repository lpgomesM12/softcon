class RelatorioController < ApplicationController
  def reserva
  end

  def reservas
    @reservas = Reserva.all
    #@reservas = Reserva.where(condominio_id: current_user.condominio_id, flag_autorizado: false, user_cancelamento: nil )
  end

  def index
      @articles = ["Article 1", "Article 2", "Article 3", "Article 4"]
      respond_to do |format|
        format.html

        format.pdf { render pdf: "articles-list-report",
          header: {center: "COMPANY NAME"},
          footer: { center: "[page] of [topage]" }
          }
      end
  end

end
