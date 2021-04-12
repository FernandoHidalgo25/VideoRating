class User < ApplicationRecord
    has_secure_password

    has_many :ratings
    has_many :videos, through: :ratings

    belongs_to :video

    validates :name, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end