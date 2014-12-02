class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
    :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :comments, foreign_key: :author_id
  has_many :relationships, :foreign_key => "follower_id",
    :dependent => :destroy
  has_many :following, :through => :relationships, :source => :followed
   acts_as_liker
  has_many :reverse_relationships, :foreign_key => "followed_id",
    :class_name => "Relationship",
    :dependent => :destroy
  has_many :followers, :through => :reverse_relationships, :source => :follower
  
  has_attached_file :avatar, :styles => {  }
      
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  def following?(followed)
    relationships.find_by_followed_id(followed)
  end

  def follow!(followed)
    relationships.create!(:followed_id => followed.id)
  end
  def unfollow!(followed)
    relationships.find_by_followed_id(followed).destroy
  end
  def feed
    Post.from_users_followed_by(self)
  end
  def self.search(search)
    if search
      find(:all, :conditions => ['firstName LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
  def current_admin
  current_user && current_user.is_admin
end
end