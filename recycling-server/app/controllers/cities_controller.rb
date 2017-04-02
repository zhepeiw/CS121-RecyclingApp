require 'elasticsearch/model'

class CitiesController < ApplicationController
  def index

  end

  def show
    @city = City.find_by_id(1)
    @categories = Category.all
    @facilities = City.find_facilities_by_city(1)
  end

  def new
    @city = City.new
    @categories = Category.all
  end
end
 