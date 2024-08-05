class HomeController < ApplicationController
  def index
    @categories = Category.includes(:books)
  end
end
