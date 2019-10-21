class User < ApplicationRecord
  has_secure_password
  has_many :pins
  has_many :ideas
  validates :name, presence: true,
                   length: { maximum: 30 }
  validates :password_digest, presence: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :email, presence: true,
                    uniqueness: true
end
