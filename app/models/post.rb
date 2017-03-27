class Post < ActiveRecord::Base

  belongs_to :user

  #validations
  validates_presence_of :title, :body, :user

end
