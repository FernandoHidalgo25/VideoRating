class CreateRatings < ActiveRecord::Migration[6.0]
    def change
      create_table :ratings do |t|
        t.string :title
        t.string :body
        t.integer :rating
        t.belongs_to :user
        t.belongs_to :video
  
        t.timestamps
      end
    end
  end