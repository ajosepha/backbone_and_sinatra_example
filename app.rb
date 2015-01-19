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

    # #database
    # set :database, "sqlite3:///database.db"


    #routes
    get '/' do
      # r1 =  Restaurant.new(:name => "Simple Pleasures", :address => "4588 Balboa St", :city => "San Francisco", :state => "CA")
      # r1.save
      # @restaruant = Restaurant.all
      erb :index
    end



    r1 =  Restaurant.new(:name => "Simple Pleasures", :address => "4588 Balboa St", :city => "San Francisco", :state => "CA")


    #helpers
    helpers do
      def partial(file_name)
        erb file_name, :layout => false
      end
    end

  end
end
