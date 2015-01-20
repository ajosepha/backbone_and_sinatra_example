require 'bundler'
Bundler.require
require './config/environments'


Dir.glob('./lib/*.rb') do |model|
  require model
end

module Name
  class App < Sinatra::Application

    #configure
    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
    end


    #routes
    get '/' do
      # r1= Restaurant.create(:name => "Simple Pleasures", :rating=>[5])
      # @restaurants = Restaurant.all
      File.read(File.join('public', 'index.html'))
    end

    get '/restaurants' do
      restaurants = Restaurant.all
      restaurants.to_json
      # get all restaurants
    end

    get '/restaurants/:id' do
      content_type :json
      @restaurant = Restaurant.find(params[:id].to_i)
      if @restaurant
        @restaurant.to_json
      else
        halt 404
      end
      # restaurant = restaurant.find(params[:id])
      # return status 404 if @restaurant.nil
      # restaurant.to_json

      # get a specific restaurant
    end

    post '/restaurants' do
      content_type :json
      request_body = JSON.parse(request.body.read)
      rating_int = request_body["rating"].to_i
      rating_int.class
      rating_array = [rating_int]  
      @restaurant = Restaurant.new(:name => request_body["name"], :rating => rating_array, :avg_rating => rating_int)
      @restaurant.save
      if @restaurant.save
        @restaurant.to_json
      else
        halt 500
      end 
    end

    put '/restaurants/:id' do
      content_type :json
      @restaurant = Restaurant.find(params[:id].to_i)
      params_json = JSON.parse(request.body.read)
      avg = []
      updated_rating = @restaurant.rating.push(params_json["rating"])
      updated_rating.each do |num|
        avg.push(num.to_i)
      end
      new_avg = avg.inject{ |sum, el| sum + el }.to_f / avg.size
      @restaurant.update(:rating => avg, :avg_rating => new_avg)
      if @restaurant.save
        @restaurant.to_json
      else
        halt 500
      end
    end

    delete '/restaurants/:id' do
      content_type :json
      @restaurant = Restaurant.find(params[:id].to_i)
      if @restaurant.destroy
        {:success => "ok"}.to_json
      else
        halt 500
      end
  
    end
    #helpers
    helpers do
      def partial(file_name)
        erb file_name, :layout => false
      end
    end

  end
end

# seed data
# r1= Restaurant.new(:name => "Simple Pleasures", :rating=>[5])
# r2 = Restaurant.new(:name => "Cafe Promenade", :rating=>[4])