require 'elasticsearch/model'
require 'json'

class CitiesController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index

  end

  def show
    @city = City.find_by_id(params[:id])
    @categories = Category.all
    @facilities = City.find_facilities_by_city(1)
    @filesJSON = @city.files
    @contributor = City.find_contributor_by_id(@city.id)
  end

  def new
    if current_user.city_id != nil
      redirect_to "/cities/#{current_user.city}"
    end

    @city = City.new
    @city.facilities.build
    @city.city_contacts.build

    @categories = Category.all
  end

  def create
    @city = City.new(permit_city)

    if @city.save
      # Update user city
      current_user.update(city_id: @city.id)

      # Construct subcategories and save them to recycles
      Category.all.each do |category|
        params[:city][:recycle]["#{category.id}"].each do |subcategory_id|
          if subcategory_id.present?
            @recycle = Recycle.new({ :city_id => @city.id,
                                     :subcategory_id => subcategory_id })
            if !@recycle.save
              flash[:error] = @city.errors.full_messages
              redirect_to new_city_path
            end
          end
        end
      end

      flash[:success] = "Success!"
      redirect_to city_path(@city)

    else
      puts @city.errors.full_messages
      puts @city.errors.inspect
      flash[:error] = @city.errors.full_messages
      redirect_to new_city_path
    end
  end

  private

  def permit_city
    params.require(:city).permit(:uid,
                                 :name,
                                 :state,
                                 :zipcode,
                                 :website,
                                 :description,
                                 :image_link,
                                 {
                                   recycle: [],
                                   files: [],
                                   city_contacts_attributes: [
                                     :id,
                                     :name,
                                     :contact
                                   ],
                                   facilities_attributes: [
                                     :id,
                                     :name,
                                     :street_address,
                                     :website
                                   ]
                                 })
  end
end
 