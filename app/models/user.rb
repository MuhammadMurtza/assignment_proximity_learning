class User < ApplicationRecord
  has_many :employments, dependent: :destroy

  store :address, accessors: [:street, :city, :state, :zip], coder: JSON
  store :personal_info, accessors: [:first_name, :last_name, :nick_name, :phone_number], coder: JSON

  validates :first_name, presence: true, length: {maximum: 25}
  validates :last_name, presence: true, length: {maximum: 50}
  validates :email, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "Email invalid"}, presence: true,
    length: {minimum: 4, maximum: 254}
  validates :phone_number, format: {with: /\A\d{3}-\d{3}-\d{4}\z/}, presence: true
end
