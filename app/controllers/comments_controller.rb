class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @comment = @book.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @book, notice: t("controller.comment_add")
    else
      redirect_to @book, notice: t("controller.comment_add_fail")
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
