class CategoriesController < ApplicationController
  def index
    @categories = Category.search_by_name(params[:name]).order_by_name_asc
  end

  def show
    @category = Category.find_by(id: params[:id])
    if @category
      @books = @category.books
    else
      redirect_to categories_path, alert: t("controller.categories_notfound")
    end
  end
end
