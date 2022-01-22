require "sinatra/base"
require "sinatra/reloader"
require "sequel"
require "pg"
require "httparty"
require "nokogiri"
require "sidekiq"
require "sidekiq/web"

class App < Sinatra::Base
  set :root,          File.dirname(__FILE__)
  set :views,         File.dirname(__FILE__) + "/app/views"
  set :public_folder, File.dirname(__FILE__) + "/app"

  configure :development do
    register Sinatra::Reloader
    also_reload "./app/lib/*"

    # Postgres debug.
    # $logger = Logger.new(STDOUT)
    # DB = Sequel.connect("postgres://arturo@localhost/development_alt_all_in", :loggers => $logger)

    # DB = Sequel.connect("postgres://arturo@127.0.0.1/development_alt_all_in")
    # DB.extension :pg_array
  end

  configure :production do
    require "rack-ssl-enforcer"
    use Rack::SslEnforcer
  end

  configure do
    # Database models.
    # require "./app/db/models/***"

    # Modules.
    # require "./app/lib/***"

    # Workers.
    # require "./app/lib/workers/***"
  end

  helpers do
  end

  # This whole application is right now a bunch of services.
  # Use these routes for testing.
  get "/" do
    # Entry.update_tm_meta
    puts "Fin."
  end

  # Testing SidekiqJob.
  get "/test-job" do
    # Run a single feed. Use this to test everything is working.
    # PushFeed.perform_async(877775)
	end

end
