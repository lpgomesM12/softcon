class AddAttachmentAvatarToIdentificacaos < ActiveRecord::Migration
  def self.up
    change_table :identificacaos do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :identificacaos, :avatar
  end
end
