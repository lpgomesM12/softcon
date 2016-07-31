class Adddadosinicial < ActiveRecord::Migration
  def change

   #Enderco softcon
   Endereco.create(:desc_endereco => 'Softocon', :cidade_id => 977)
   #condominio softcon
   Condominio.create(:nome_condominio => 'Softcon Admin', :email => 'softconsuporte@hotmail.com', :endereco_id => 1)
   #criando grupos permissão
   Grupopermissao.create(:nome => 'ADMSOFTCON')
   Grupopermissao.create(:nome => 'ADMINISTRACAO')
   Grupopermissao.create(:nome => 'SUPERVISAO')
   Grupopermissao.create(:nome => 'MORADOR')
   #criando pessoa suftcon suporte
   Pessoa.create(:nome_pessoa => 'Softcon Suporte')
   #criando usuário para softcon
   User.create(:pessoa_id => 1, :email => "softconsuporte@hotmail.com", :password => "bcoambar", :password_confirmation => "bcoambar", :condominio_id => 1)

   Grupopermissaouser.create(:user_id => 1, :grupopermissao_id => 1, :condominio_id => 1)

  end
end
