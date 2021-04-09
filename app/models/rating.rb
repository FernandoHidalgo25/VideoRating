class Rating < ApplicationRecord
    belongs_to :video
    belongs_to :user
    accepts_nested_attributes_for :video
    #accepts_nested_attributes_for :user

    validates :title, presence: true, length: { maximum: 25 }
    validates :body, presence: true
    validates :rating, presence: true, numericality: {less_than_or_equal_to: 100, greater_than_or_equal_to: 0}

   #def self.latest
    #all.order('created_at desc').limit(10)
   #end

    scope :latest, -> { order('created_at desc').limit(10)}
end
