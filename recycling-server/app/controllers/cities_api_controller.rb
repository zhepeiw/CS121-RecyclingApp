class CitiesApiController < ApplicationController
  def get_cities()
    # Not implemented
  end

  def get_city_by_id()
    # Not implemented
  end

  def get_categories_by_id()
    # Not implemented
  end

  def get_subcategories_by_id()
    # Not implemented
  end

  def get_facilities()
    @facilities = City.find_facilities_by_city(params[:id])
    respond_to do |format|
      format.json {
        render json: { :facilities => @facilities }
      }
    end
  end

end
