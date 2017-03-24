class SearchController < ApplicationController
  def index
    # Search twice
    @cities = City.search(params[:q]).results.to_a
    @categories = Category.search(params[:q]).results.to_a
    
    # Present search result sample calls
    # puts @results.length
    # @results.each do |result|
    #   puts result._source
    #   puts result._score
    # end
  end
end
