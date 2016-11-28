class AddAttachmentFotoToFotoordemservices < ActiveRecord::Migration
  def self.up
    change_table :fotoordemservices do |t|
      t.attachment :foto
    end
  end

  def self.down
    remove_attachment :fotoordemservices, :foto
  end
end
