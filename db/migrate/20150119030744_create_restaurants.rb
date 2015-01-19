class CreateRestaurants < ActiveRecord::Migration
	def change
		create_table :reviews do |t|
			t.integer :score
			t.string :address
			t.string :city
			t.string :state
		end
	end
end
