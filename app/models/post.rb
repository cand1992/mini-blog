class Post < ActiveRecord::Base
  belongs_to :author
  has_many :comments, dependent: :destroy
  attr_accessible :body, :published_at, :title, :author_id
  validates :author, presence: {message: "must actually exist."}
  validates  :body, :title, presence: true
  validates :body, length: { minimum: 50 }
  validates :title, length: { minimum: 5 }
end
