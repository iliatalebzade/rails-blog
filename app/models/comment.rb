class Comment < ApplicationRecord
  validates :content, length: { minimum: 2, maximum: 225 }, presence: true
  belongs_to :post
  belongs_to :user
end
