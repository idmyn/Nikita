class User < ApplicationRecord
    has_secure_password
    has_many :pins
    has_many :ideas

end
