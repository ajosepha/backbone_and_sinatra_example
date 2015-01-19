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
      restaurant = restaurant.find(params[:id])
      return status 404 if @restaurant.nil
      restaurant.to_json

      # get a specific restaurant
    end

    post '/restaurant' do
      restaurant = Restaurant.new(params[:id])
      restaurant.save
      status 202
      # create a new restaurant (will not be implemented here)
      # @restaurant = Restaurant.new()
    end

    put '/restaurant/:id' do
      restaurant = Restaurant.find(params[:id])
      return status 404 if restaurant.nil?
      restaurant.update(params[:id])
      restaurant.save
      status 202
      # update an existing restaurant
    end

    delete '/restaurant/:id' do
      restaurant = Restaurant.find(params[:id])
      return status 404 if restaurant.nil?
      restaurant.delete
      status 202
    # =>  delete an item
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