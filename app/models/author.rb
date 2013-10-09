class Author < ActiveRecord::Base
  has_secure_password
  has_many :posts
  has_many :comments, through: :posts
  attr_accessible :bio, :email, :first_name, :last_name, :twitter, :username, :password, :password_confirmation
  #presence
  validates :password, :password_confirmation, presence: true, on: :create
  validates :email, :first_name, :last_name, :username, presence: true
  #uniqueness
  validates :email, :username, :twitter, uniqueness: true, allow_blank: true
  #length
  validates :password, :password_confirmation, length: {in: 6..24}
  #validates :email, presence: true,
   #                 uniqueness: true,
   #                 length: { minimum: 3}
   def full_name
    (first_name + ' ' + last_name).titleize
   end
end
