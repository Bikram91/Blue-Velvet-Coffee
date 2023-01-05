class Api::ProductsController < ApplicationController
    def index
        @products = Product.all
        render :index
    end

    def show
        @product = Product.where('name ILIKE (?)', capitalize_name(params[:product_name])).order(:id)
        render :show
    end

    # def search
    # end
end