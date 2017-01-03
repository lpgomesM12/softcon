class Morador < ActiveRecord::Base
  belongs_to :apartamento
  validates :apartamento_id, :presence => { :message => 'Escolha um apartamento' }
  belongs_to :pessoa

  belongs_to :inclusao, :class_name => "User", :foreign_key => "user_inclusao"

  accepts_nested_attributes_for :pessoa, allow_destroy: true

  def self.search(term,condominio)
    result = term =~ /[[:digit:]]/
    sql = " INNER JOIN pessoas pe on moradors.pessoa_id = pe.id"
    if result == 0
      sql = sql + " WHERE lower(pe.cpf) like '%#{term.downcase}%'"
    else
          sql = sql + " WHERE lower(pe.nome_pessoa) like '%#{term.downcase}%'"
    end
    sql = sql + " AND condominio_id = #{condominio}"
    self.joins(sql)
  end

end
