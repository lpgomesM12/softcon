class Pessoa < ActiveRecord::Base
 has_many :moradors

 has_many :veiculos, dependent: :destroy
 accepts_nested_attributes_for :veiculos, allow_destroy: true

 #has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }  #, default_url: "/img/default.png"
 #validates_attachment_content_type :avatar, :content_type => {content_type: ["image/jpeg", "image/gif", "image/png"]}
has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/default.png"
 validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

 #validates_attachment_content_type :document, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif", "application/force-download"]


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
