class Idea < ApplicationRecord
    belongs_to :user
    has_many :pins, dependent: :destroy
    has_many :users, through: :pins

    validates :title, presence: true
    validates :title, length: {maximum: 75}
    validates :body, length: {maximum: 300}

    def pinned_by?(user)
        pins.find_by(user_id: user.id)
    end

    def pins_count
        "Pinned #{pins.count} times "
    end

    
end
