class User < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :condominio
  has_one :grupopermissaouser, dependent: :destroy
  belongs_to :exclusao, :class_name => "User", :foreign_key => "user_exclusao"

  attr_accessor :grupopermissao_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 def tem_permissao(grupo)
       @grupopermissao =  Grupopermissaouser.where("user_id = ? AND grupopermissao_id IN (?)",self.id, grupo)
       @grupopermissao.empty? ? false : true
 end

end
