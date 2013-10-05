class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :commenter_name, :message, :post_id
  validates :commenter_name, :message, :post, presence: true
  validates :message, length: { minimum: 30 }
end
