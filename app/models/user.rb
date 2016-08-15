class User < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :condominio
  has_one :grupopermissaouser

  attr_accessor :grupopermissao_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


 def tem_permissao(grupo)
       @grupopermissao =  Grupopermissaouser.where(grupopermissao_id: grupo , user_id: self.id)
       @grupopermissao.empty? ? false : true
 end


 # def grupopermissao_id
 #   @grupopermissao_id
 # end

 # setter
 # def grupopermissao_id=(val)
 #   @grupopermissao_id = val
 # end

end
