require "sinatra/base"
require "sinatra/reloader"
# Delete for no db apps.
require "sequel"
require "pg"
require "logger"

class App < Sinatra::Base
  set :root,          File.dirname(__FILE__)
  set :views,         File.dirname(__FILE__) + "/app/views"
  set :public_folder, File.dirname(__FILE__) + "/app"

  # Delete for no db apps.
  configure :development do
    register Sinatra::Reloader
    also_reload "./app/lib/*"

    # Handy to debug SQL locally.
    $logger = Logger.new(STDOUT)
    # Use this line to show database log.
    # DB = Sequel.connect("postgres://arturo@localhost/development_edex", :loggers => $logger)
    DB = Sequel.connect("postgres://arturo@localhost/development_edex")
    DB.extension :pg_array
  end

  # Delete for no db apps.
  configure :production do
    # Set up database connection and load extension.
    DB = Sequel.connect(ENV["DATABASE_URL"])
    DB.extension :pg_array
  end

  # Delete for no db apps.
  configure do
    # Database models.
    # require "./app/db/models/customer.rb"

    # Modules.
    require "./app/lib/utils.rb"
  end

  helpers do
  end

  get "/" do
    puts "Fin."
  end
end
