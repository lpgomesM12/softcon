class Apartamento < ActiveRecord::Base
  belongs_to :condominio

  #Validações
  validates :numr_apartamento, presence: { message: "precisa de" }
  validates :numr_bloco, presence: true


  def self.apartamento_morador(pessoa, condominio)
      sql = " INNER JOIN moradors mo on apartamentos.id = mo.apartamento_id"
      sql = sql + " WHERE mo.pessoa_id = #{pessoa}"
      sql = sql + " AND apartamentos.condominio_id = #{condominio}"
      self.joins(sql)
  end

 def nome
   self.numr_bloco + " - " + numr_apartamento
 end

end
