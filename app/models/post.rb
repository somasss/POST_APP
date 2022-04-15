class Post < ApplicationRecord
  validates :content, length: { minimum: 1 }, length: { maximum: 140 }, presence: true
end
