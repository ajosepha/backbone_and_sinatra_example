class Restaurant < ActiveRecord::Base
	# has_many :reviews

	def self.make_restaurants
		r1= Restaurant.new(:name => "Simple Pleasures", :rating=>[5])
		r1.save
		r2 = Restaurant.new(:name => "Cafe Promenade", :rating=>[4])
		r2.save
	end
end

class Review < ActiveRecord::Base
	# belongs_to :restaurant
end



