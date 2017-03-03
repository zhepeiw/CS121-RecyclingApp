class CitiesController < ApplicationController
  def index
  end

  def show
    @categories = Category.all
    @city = City.find_by_id(1)
  end
end
