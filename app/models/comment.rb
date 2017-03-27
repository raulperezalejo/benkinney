class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  #validation
  validates_presence_of :body, :post, :user

end
