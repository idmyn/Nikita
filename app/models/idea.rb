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
        result.push([all_ideas[i].to_hash, all_ideas[i + 1]&.to_hash])
        i += 2
      end
      result
    end

    def to_hash
      {
        title: self.title,
        body: self.body,
        user_id: self.user_id,
        username: self.user.name,
        id: self.id,
        pin_count: self.pins.count,
        pinner_ids: self.users.map(&:id)
      }
    end

    def pinned_by?(user)
        pins.find_by(user_id: user.id)
    end

    def pins_count
        pins.count == 1 ? "Pinned #{pins.count} time" : "Pinned #{pins.count} times"
    end
end
