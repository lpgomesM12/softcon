class Ocorrencium < ActiveRecord::Base
  belongs_to :identificacao
  belongs_to :apartamento
  belongs_to :condominio
  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"
  belongs_to :userbaixa, :class_name => "User", :foreign_key => "user_baixa"

  validates :apartamento_id, presence: { message: "Pesquise por um apartamento" }

  accepts_nested_attributes_for :identificacao

  def self.relatorio(data_inicio,data_fim,tipo,apartamento,nome)
     sql =  " INNER JOIN identificacaos inde on ocorrencia.identificacao_id = inde.id"
     sql = sql + " WHERE"
     sql = sql + " ocorrencia.created_at BETWEEN #{data_inicio} AND #{data_fim}"
     if tipo != "" && tipo != nil
      sql = sql + " AND tipoocorrencium_id = #{tipo}"
     end
     if apartamento != "" && apartamento != nil
       sql = sql + " AND apartamento_id = #{apartamento}"
     end
     if nome != "" && nome != nil
       sql = sql + " AND lower(inde.desc_nome) like '%#{nome.downcase}%'"
     end
     self.joins(sql)
  end
end
