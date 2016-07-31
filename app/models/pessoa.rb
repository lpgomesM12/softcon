class Pessoa < ActiveRecord::Base

 has_many :moradors

  def self.search(term,condominio)
    sql = " INNER JOIN moradors mo on pessoas.id = mo.pessoa_id"
    sql = sql + " WHERE lower(nome_pessoa) like '%#{term.downcase}%'"
    sql = sql + " AND mo.condominio_id = #{condominio}"
    self.joins(sql)
  end

end
