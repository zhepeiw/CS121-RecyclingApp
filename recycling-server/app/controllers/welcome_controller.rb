class WelcomeController < ApplicationController
  def index
    @categories = Category.all
  end

  def download
    send_file params[:file],
      :type => 'application/pdf'
  end
end
