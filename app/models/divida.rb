class Divida < ActiveRecord::Base
  belongs_to :condominio
  belongs_to :contabank
  belongs_to :prestador
  belongs_to :despesa
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao"
  belongs_to :cancelamento, :class_name => "User", :foreign_key => "user_cancelamento"


  def self.busca_dividas(condominio,flag_pago,flag_naopago,flag_despesafixa,flag_ordinaria,data_inicio,data_fim)

    @or = "AND"
    sql = " condominio_id = #{condominio}"
      if flag_pago == "true"
        sql = sql + " AND (flag_pago = true"
        @or = "OR"
      end
      if flag_naopago == "true"
        sql = sql + " #{@or} flag_pago = false"
      end
      if @or == "OR"
       sql = sql + ")"
      end
      if flag_ordinaria == "true"
        sql = sql + " AND flag_ordinaria = true"
      end
      if flag_despesafixa == "true"
        sql = sql + " AND flag_despesafixa = true"
      end
       sql = sql + " AND (data_vencimento >= '#{data_inicio}' AND data_vencimento <= '#{data_fim}')"

    where sql

  end


end
