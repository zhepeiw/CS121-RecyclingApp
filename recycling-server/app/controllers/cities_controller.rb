require 'elasticsearch/model'

class CitiesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index

  end

  def show
    @city = City.find_by_id(params[:id])
    @categories = Category.all
    @facilities = City.find_facilities_by_city(1)
  end

  def new
    @city = City.new
    @city.facilities.build

    @categories = Category.all
  end

  def create
    @city = City.new(permit_city)
    if @city.save
      puts @city

      # Construct subcategories and save them to recycles
      @city.subcategories.each do |subcategory|
        if subcategory != ''
          @recycle = Recycle.new({ :city_id => @city.id,
                                   :subcategory_id => subcategory })
          if @recycle.save
            flash[:success] = "Success!"
            redirect_to city_path(@city)
          end
        end
      end
    else
      flash[:error] = @city.errors.full_messages
      redirect_to new_city_path
    end
  end

  private

  def permit_city
    params.require(:city).permit(:name,
                                 :state,
                                 :zipcode,
                                 :description,
                                 :image_link,
                                 facilities_attributes: [
                                     :id,
                                     :name,
                                     :street_address,
                                     :website
                                 ])
  end
end
 