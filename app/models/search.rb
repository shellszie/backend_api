class Search < ApplicationRecord
  validates :user_id, presence: true
  validates :search_term, presence: true
  validates_format_of :search_term, with: /[a-zA-Z-*\s\d\w]/, message: "Must not contain special characters"
end
