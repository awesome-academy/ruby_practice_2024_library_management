class AuthorsController < ApplicationController
  def index
    @authors = Author.search_by_name(params[:name]).order_by_name_asc
  end

  def show
    @author = Author.find_by(id: params[:id])
    if @author
      @books = @author.books
    else
      redirect_to authors_path, alert: t("controller.author_notfound")
    end
  end
end
