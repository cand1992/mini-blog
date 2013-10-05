class Author < ActiveRecord::Base
  has_many :posts
  has_many :comments, through: :posts
  attr_accessible :bio, :email, :first_name, :last_name, :twitter, :username
  #presence
  validates :email, :first_name, :last_name, :username, presence: true
  #uniqueness
  validates :email, :username, :twitter, uniqueness: true, allow_blank: true
  #length
  validates :bio, length: {in: 30..500}
  #validates :email, presence: true,
   #                 uniqueness: true,
   #                 length: { minimum: 3}
   def full_name
    (first_name + ' ' + last_name).titleize
   end
end
