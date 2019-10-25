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
    ideas.reverse.sort_by { |idea| idea.pins.count }.reverse
  end

  def most_recent_idea
    ideas.reverse.first
  end

  def most_pinned_idea
    most_pinned_ideas.first
  end
end
