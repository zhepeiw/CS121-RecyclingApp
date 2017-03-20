class CategoriesController < ApplicationController
  def index
  end

  def show
    # queries of categoreis
    @category = Category.find_by_id(params[:id])
  end
end
