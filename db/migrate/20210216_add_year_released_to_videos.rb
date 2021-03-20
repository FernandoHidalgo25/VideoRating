class AddYearReleasedToVideos < ActiveRecord::Migration[6.0]
    def change
      add_column :videos, :year_released, :integer
    end
  end