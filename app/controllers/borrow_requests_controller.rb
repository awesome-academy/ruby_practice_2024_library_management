class BorrowRequestsController < ApplicationController
  before_action :set_book, only: %i(new create)
  before_action :set_borrow_request, only: %i(destroy)

  def new
    @borrow_request = @book.borrow_requests.new
  end

  def create
    @borrow_request = @book.borrow_requests.new(borrow_request_params)
    @borrow_request.user = current_user

    if @borrow_request.save
      redirect_to @book, notice: t("controller.request_borrow")
    else
      flash.now[:alert] = t("controller.request_error")
      render :new
    end
  end

  def destroy
    if @borrow_request.destroy
      render json: {message: "Yêu cầu mượn sách đã được hủy."},
             status: :no_content
      flash[:notice] = t("controller.cancel_succeed")
    else
      render json: {errors: @borrow_request.errors.full_messages},
             status: :unprocessable_entity
      flash.now[:alert] = t("controller.cancel_error")
    end
  end

  private

  def set_book
    @book = Book.find_by(id: params[:book_id])
  end

  def borrow_request_params
    params.require(:borrow_request).permit(:start_date, :end_date)
  end

  def set_borrow_request
    @borrow_request = BorrowRequest.find_by(id: params[:id])
  end
end
