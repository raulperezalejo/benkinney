class Comment < ActiveRecord::Base

  default_scope { order(created_at: :asc) }

  belongs_to :post
  belongs_to :user

  #Validators
  validates_presence_of :body, :post, :user

end
