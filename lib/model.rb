class Restaurant < ActiveRecord::Base
	has_many :reviews
end

# class Review < ActiveRecord::Base
# 	belongs_to :restaurant
# end

class Score < ActiveRecord::Base
  belongs_to :restaurant
end

