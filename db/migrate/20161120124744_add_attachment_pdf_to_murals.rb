class AddAttachmentPdfToMurals < ActiveRecord::Migration
  def self.up
    change_table :murals do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :murals, :pdf
  end
end
