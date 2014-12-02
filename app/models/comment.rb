require 'obscenity/active_model'
class Comment < ActiveRecord::Base
include PublicActivity::Model
tracked owner: ->(controller, model) { controller && controller.current_user }
  belongs_to :post
  belongs_to :author, class_name: User, foreign_key: :author_id
   validates :body, :presence => { :message => " Comment cant be empty" }, :obscenity=> { sanitize: true,  replacement: :vowels  }

end
