require "./app"

# run App.new
run Rack::URLMap.new("/" => App, "/sidekiq" => Sidekiq::Web)
