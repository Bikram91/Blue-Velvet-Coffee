class Api::ReviewsController < ApplicationController
  before_action :require_logged_in, only: [:create, :update, :destroy]

  def index
    @reviews = Review.where(product_id: params[:product_id])
    render :index
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      render :show
    else
      render json: { errors: @review.errors.full_messages }, status: 422
      # render json: {message: "hi"}
    end
  end

  def update
    @review = Review.find_by(id: params[:id])
    if @review && @review.update(review_params)
      render :show
    else
      render json: { errors: @review.errors.full_messages }, status: 422
    end
  end

  def destroy
    @review = Review.find_by(id: params[:id])

    if @review.destroy
      render json: { messsage: "Review is successfully removed" }
    end
  end

  private

  def review_params
    params.require(:review).permit(:user_id, :product_id, :reviewer_name, :title, :body, :rating)
  end
end
