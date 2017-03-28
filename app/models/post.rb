class Post < ActiveRecord::Base

  default_scope { order(created_at: :desc) }

  belongs_to :user
  has_many :comments, :dependent => :destroy

  #Validations
  validates_presence_of :title, :body, :user

end
