class Idea < ApplicationRecord
    belongs_to :user
    has_many :pins, dependent: :destroy
    has_many :users, through: :pins

    validates :title, presence: true
    validates :title, length: {maximum: 75}
    validates :body, length: {maximum: 300}

    def self.idea_pairs
      all_ideas = self.all.reverse
      i = 0
      result = []
      until i >= all_ideas.length
        result.push([all_ideas[i], all_ideas[i + 1]])
        i += 2
      end
      result
    end

    def pinned_by?(user)
        pins.find_by(user_id: user.id)
    end

    def pins_count
        pins.count == 1 ? "Pinned #{pins.count} time" : "Pinned #{pins.count} times"
    end
end
