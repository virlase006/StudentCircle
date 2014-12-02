require 'obscenity/active_model'
class Post < ActiveRecord::Base
include PublicActivity::Model
tracked owner: ->(controller, model) { controller && controller.current_user }
  include SimpleHashtag::Hashtaggable
	belongs_to :user
	has_many :comments

acts_as_likeable
  validates :body, :presence => { :message => " Post cant be empty" }, :obscenity=> { sanitize: true,  replacement: :vowels  }
		belongs_to :category
		
	 has_attached_file :document
  validates_attachment_content_type :document, :content_type => /\A*\/.*\Z/
def self.from_users_followed_by(user)
followed_user_ids = "SELECT followed_id FROM relationships
WHERE follower_id = :user_id"
where("user_id IN (#{followed_user_ids}) OR user_id = :user_id",
user_id: user.id)
end
end
