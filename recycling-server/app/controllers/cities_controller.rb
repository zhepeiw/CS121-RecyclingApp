require 'elasticsearch/model'

class CitiesController < ApplicationController
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

  def show
    @city = City.find_by_id(1)
    @categories = Category.all
    @facilities = City.find_facilities_by_city(1)
  end
end
 