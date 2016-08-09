class Pessoa < ActiveRecord::Base

 has_many :moradors

  def self.search(term,condominio)

    result = term =~ /[[:digit:]]/

    sql = " INNER JOIN moradors mo on pessoas.id = mo.pessoa_id"
    if result == 0
      sql = sql + " WHERE lower(cpf) like '%#{term.downcase}%'"
    else
          sql = sql + " WHERE lower(nome_pessoa) like '%#{term.downcase}%'"
    end
    sql = sql + " AND mo.condominio_id = #{condominio}"
    self.joins(sql)
  end

end
