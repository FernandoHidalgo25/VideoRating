class User < ApplicationRecord
    has_secure_password

    has_many :ratings
    has_many :videos, through: :ratings

    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end