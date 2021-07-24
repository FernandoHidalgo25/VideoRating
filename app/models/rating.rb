class Rating < ApplicationRecord
    belongs_to :video
    belongs_to :user, :optional => true
    accepts_nested_attributes_for :video
    
    validates :title, presence: true, length: { maximum: 25 }
    validates :body, presence: true   
    scope :higher, -> { where('rating > 89') }
    validates :rating, presence: true, numericality: {less_than_or_equal_to: 100, greater_than_or_equal_to: 0}
    
    scope :latest, -> { order('created_at desc').limit(10)}
end