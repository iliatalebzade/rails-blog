class Post < ApplicationRecord
  validates :title, length: { minimum: 6, maximum: 100 }, presence: true
  validates :body, length: { minimum: 200 }, presence: true
  validates :user_id, presence: true

  has_rich_text :body

  belongs_to :user
end
