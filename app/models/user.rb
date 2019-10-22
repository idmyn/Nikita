class User < ApplicationRecord
  has_secure_password
  has_many :pins, dependent: :destroy
  has_many :ideas, dependent: :destroy

  validates :name, presence: true,
                   length: { maximum: 30 }
  validates :password_digest, presence: true
  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :email, presence: true,
                    uniqueness: true


  def most_pinned_ideas
    ideas.sort_by {|idea| idea.pins.count }.reverse
  end




end
