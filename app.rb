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
      @restaurants = Restaurant.all

      erb :index
    end

    get '/restaurants' do
      @restaurant = Restaurant.all
      # get all restaurants
    end

    get '/restaurants/:id' do
      @restaurant = restaurant.find([:params])
      # get a specific restaurant
    end

    post '/restaurant' do
      # create a new restaurant (will not be implemented here)
    end

    put '/restaurant/:id' do
      # update an existing restaurant
    end

    delete '/restaurant/:id' do
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