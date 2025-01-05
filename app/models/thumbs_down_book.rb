class ThumbsDownBook < ApplicationRecord
  validates :user_id, presence: true
  validates :isbn, presence: true
  validates :title, presence: true
  validates :author, presence: true
  validates_format_of :isbn, with: /[\d]/, message: "Must only contain numbers"
end
