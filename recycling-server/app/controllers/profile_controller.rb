class ProfileController < ApplicationController
  before_action :authenticate_user!

  def show
    @city = nil
    if current_user.city
      @city = City.find_by_id(current_user.city)
    end
  end
end
