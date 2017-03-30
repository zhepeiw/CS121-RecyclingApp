class SearchController < ApplicationController
  def index
    # Search models individually to keep track of types
    @cities = City.search(params[:q]).results.to_a
    @categories = Category.search(params[:q]).results.to_a
    @subcategories = Subcategory.search(params[:q]).results.to_a

    # Get the categories entailed in from subcategory search
    categoryIDs = Array.new
    @categories.each do |category|
        categoryIDs.push(category.id)
    end
    additionalCategoryIDs = Array.new
    @subcategories.each do |subcategory|
        if categoryIDs.include?(subcategory.category_id.to_s) == false && additionalCategoryIDs.include?(subcategory.category_id) == false
            additionalCategoryIDs.push(subcategory.category_id)
        end
    end

    # Add these categories to @category for display
    additionalCategoryIDs.each do |id|
        @categories.push(Category.find_by_id(id))
    end

    # Present search result sample calls
    # puts @results.length
    # @results.each do |result|
    #   puts result._source
    #   puts result._score
    # end
  end
end
