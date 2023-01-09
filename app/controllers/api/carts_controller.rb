class Api::CartsController < ApplicationConroller
  before_action :require_logged_in

  def index
    @user = User.find(params[:user_id])
    @carts = Cart.where(customer_id: @user[:id])
  end

  def create
    @cart = Cart.new(cart_params)
    if @cart.save
      render :show
    else
      render json: { errors: @cart.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    @cart = Cart.find_by(id: params[:id])
    if @cart && @cart.update(cart_params)
      render :show
    else
      render json: { errors: @cart.errors.full_messages }, status: :uprocessable_entity
    end
  end

  def destroy
    @cart = current_user.carts.find_by(id: params[:id])
    if @cart.destroy
      @carts = Cart.all
      render :index
    else
      render json: { errors: @cart.errors.full_messages }, status: :uprocessable_entity
    end
  end

  def cart_params
    params.require(:cart).permit(:id, :customer_id, :quantity, :product_id)
  end
end
