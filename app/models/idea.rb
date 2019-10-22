class Idea < ApplicationRecord
    belongs_to :user
    has_many :pins
    has_many :users, through: :pins

    validates :title, presence: true
    validates :title, length: {maximum: 75}
    validates :body, length: {maximum: 300}
end
