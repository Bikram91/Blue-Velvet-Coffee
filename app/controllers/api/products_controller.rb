class Api::ProductsController < ApplicationController
    def index
        case params[:category]
        when nil
          @products = Product.all
        when 'undefined'
          @products = Product.all
        when 'All Products'
          @products = Product.all
        when 'HOLIDAY COFFEE SET'
          @products = Product.where("category = 'HOLIDAY COFFEE SET'")
        when 'Espresso'
          @products = Product.where("category = 'Espresso'")
        when 'Blend'
          @products = Product.where("category = 'Blend'")
        when 'Single Origin'
          @products = Product.where("category = 'Single Origin'")
        end
        render :index
    end

    def show
        @product = Product.find(params[:id])
        render :show
    end

    def search
      query = params[:query]
      @products = Product.where("name ILIKE ?", "%#{query}%")
      render :index
    end
end