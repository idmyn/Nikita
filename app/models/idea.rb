class Idea < ApplicationRecord
    belongs_to :user
    has_many :pins
    has_many :users, through: :pins
    
end
