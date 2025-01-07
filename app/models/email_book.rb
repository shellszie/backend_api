class EmailBook < ApplicationRecord
  validates :user_id, presence: true
  validates :title, presence: true
  validates :author, presence: true
  validates :isbn, presence: true
  validates_format_of :isbn, with: /[\d]/, message: "Must only contain numbers"
  validates :img_url, presence: true
  validates :preview_url, presence: true
end
