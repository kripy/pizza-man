require "sinatra/base"
require "sinatra/reloader"

class App < Sinatra::Base
  set :root,          File.dirname(__FILE__)
  set :views,         File.dirname(__FILE__) + "/app/views"
  set :public_folder, File.dirname(__FILE__) + "/app"

  configure :development do
    register Sinatra::Reloader
    also_reload "./app/lib/*"
  end

  configure :production do
  end

  configure do
    # Modules.
    require "./app/lib/utils.rb"
  end

  helpers do
  end

  get "/test" do
    puts "Fin."
  end
end
