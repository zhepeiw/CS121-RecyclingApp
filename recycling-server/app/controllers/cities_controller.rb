class CitiesController < ApplicationController
  def index
  end

  def show
    @city = City.find_by_id(1)
    @categories = Category.all
  end
end
