require 'elasticsearch'

config = {
    host: "http://search:9200",
    user: "elastic",
    password: "changeme",
}

if File.exists?("config/elasticsearch.yml")
  config.merge!(YAML.load_file("config/elasticsearch.yml")[Rails.env].symbolize_keys)
end

Elasticsearch::Model.client = Elasticsearch::Client.new(config)
