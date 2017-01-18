class Morador < ActiveRecord::Base
  belongs_to :apartamento
  validates :apartamento_id, :presence => { :message => 'Escolha um apartamento' }
  belongs_to :pessoa

  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"

  accepts_nested_attributes_for :pessoa

  def self.search(term, condominio, apartamento_id = 0)
    result = term =~ /[[:digit:]]/
    sql = " INNER JOIN pessoas pe on moradors.pessoa_id = pe.id"
    if term != 0
        if result == 0
          sql = sql + " WHERE lower(pe.cpf) like '%#{term.downcase}%'"
        else
              sql = sql + " WHERE lower(pe.nome_pessoa) like '%#{term.downcase}%'"
        end
    end
    if apartamento_id != 0
       sql = sql + " apartamento_id = '#{apartamento_id}'"
    end
    sql = sql + " AND condominio_id = #{condominio}"
    self.joins(sql)
  end

end
