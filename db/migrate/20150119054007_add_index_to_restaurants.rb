class AddIndexToRestaurants < ActiveRecord::Migration
	def change
		add_index(:restaurants, :name)
	end
  # def up
  # end

  # def down
  # end
end
