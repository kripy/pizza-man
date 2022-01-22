require "rake"
require "sidekiq"

Sidekiq.configure_client do |config|
  config.redis = {url: ENV["REDIS_URL"] }
end

# Left as an example.
# desc "Run Feedbin collector."
# task :sidekiq_feedbin_collector do
#   include Sidekiq::Worker
#
#   arr_subs = [1267650, 1533142, 1510800, 877775, 1627802, 1150554, 838741, 1717415, 1325157, 1937885, 1345896, 1937884, 6743, 1613391, 1937883, 1057585, 1937882, 1768569, 1469569, 1200342, 1408623, 1937881, 1604023, 1443492, 981509, 1233267, 1106656, 10102, 1472314, 1937842, 895151]
#   arr_subs.each { |x|
#     Sidekiq::Client.push("queue" => "entry", "retry" => 3, "class" => "PushEntry", "args" => ["#{x}"])
#   }
# end
