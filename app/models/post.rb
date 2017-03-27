class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments, :dependent => :destroy

  # scope :comments, -> { order(created_at: :desc) }

  #validations
  validates_presence_of :title, :body, :user

end
