class Apartamento < ActiveRecord::Base
  belongs_to :condominio


 def nome
   self.numr_bloco + " " + numr_apartamento 
 end

end
