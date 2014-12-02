class Document < ActiveRecord::Base
 has_attached_file :attachmentfile
  validates_attachment_content_type :attachmentfile,  :content_type => /\A*\/.*\Z/
end
