class AddAttachmentAttachmentfileToDocuments < ActiveRecord::Migration
  def self.up
    change_table :documents do |t|
      t.attachment :attachmentfile
    end
  end

  def self.down
    drop_attached_file :documents, :attachmentfile
  end
end
