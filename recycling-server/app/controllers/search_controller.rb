class SearchController < ApplicationController
  def index
    # Search twice
    @cities = Elasticsearch::Model.search(params[:q], [City]).results.to_a
    @categories = Elasticsearch::Model.search(params[:q], [Category]).results.to_a
    
    # Present search result sample calls
    # puts @results.length
    # @results.each do |result|
    #   puts result._source
    #   puts result._score
    # end
  end
end
