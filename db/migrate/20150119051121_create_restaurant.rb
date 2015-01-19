class CreateRestaurant < ActiveRecord::Migration

	def change
		create_table :restaurants do |t|
			t.string :name
			t.text :rating, array: true, default: []
		end
	end
  # def up
  # end

  # def down
  # end
end
