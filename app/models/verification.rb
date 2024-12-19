class Verification < ApplicationRecord
  validates :user_id, presence: true
  validates :code, presence: true
  validates_format_of :code, with: /[a-zA-Z\d]/, message: "Must not contain special characters"
end
