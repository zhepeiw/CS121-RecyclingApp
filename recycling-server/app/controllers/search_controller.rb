class SearchController < ApplicationController
  def index
    # Search with multiple models
    @results = Elasticsearch::Model.search(params[:q], [City, Category]).results.to_a

    # Present search result
    puts @results.length
    @results.each do |result|
      puts result._source
      puts result._score
    end
  end
end
