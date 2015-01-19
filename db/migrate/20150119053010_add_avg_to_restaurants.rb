class AddAvgToRestaurants < ActiveRecord::Migration
	def change
		add_column :restaurants, :avg_rating, :decimal
	end
  # def up
  # end

  # def down
  # end
end
