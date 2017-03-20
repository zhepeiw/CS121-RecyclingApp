class CategoriesController < ApplicationController
  def index
  end

  def show
    # queries of categoreis
    @category = Category.find_by_id(1)
  end
end
