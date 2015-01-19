class CreateScores < ActiveRecord::Migration
  def change
  	 create_table :scores do |t|
      	t.integer :rating
      	t.integer :restaurant_id
    end
  end

end
