require 'elasticsearch'

config = {}

if File.exists?('config/elasticsearch.yml')
  config.merge!(YAML.load_file('config/elasticsearch.yml')[Rails.env].symbolize_keys)
  config[:host] = "http://#{config[:hostname]}:#{config[:port]}"
else
  config[:host] = 'http://search:9200'
  config[:user] = 'elastic'
  config[:password] = 'changeme'
end

Elasticsearch::Model.client = Elasticsearch::Client.new(config)
