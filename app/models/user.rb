class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts, :dependent => :destroy
  has_many :comments, :dependent => :destroy

  #Validations
  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email


end
