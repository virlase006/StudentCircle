class AddAttachmentDocumentToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :document
    end
  end

  def self.down
    drop_attached_file :posts, :document
  end
end
