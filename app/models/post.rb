class Post < ApplicationRecord
  validates :title, length: { minimum: 6, maximum: 100 }, presence: true
  validates :body, length: { minimum: 200 }, presence: true

  belongs_to :user
end
