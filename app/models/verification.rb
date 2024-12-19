class Verification < ApplicationRecord
  validates :email, presence: true
  validates :code, presence: true
  validates_format_of :code, with: /[a-zA-Z\d]/, message: "Must not contain special characters"
  validates_format_of :email,  with: /\A[^@\s]+@[^@\s]+\z/, message: "Must be a valid email address"
end
