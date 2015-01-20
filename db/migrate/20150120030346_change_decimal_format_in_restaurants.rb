class ChangeDecimalFormatInRestaurants < ActiveRecord::Migration
	def change
		change_column :restaurants, :avg_rating, :float
	end
  # def up
  # end

  # def down
  # end
end
