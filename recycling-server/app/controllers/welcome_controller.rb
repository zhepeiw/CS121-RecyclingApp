class WelcomeController < ApplicationController
  def index
    @categories = Category.all
  end

  def download
    if Rails.env.production?
      redirect_to "https://s3.amazonaws.com/cs121-recycling-server-assets/#{params[:file]}"
    else
      send_file params[:file],
                :type => 'application/pdf'
    end
  end
end
