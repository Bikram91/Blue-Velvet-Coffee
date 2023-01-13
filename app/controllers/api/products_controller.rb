class Api::ProductsController < ApplicationController
    def index
        case params[:category]
        when nil
          @products = Product.all
        when 'undefined'
          @products = Product.all
        when 'All Products'
          @products = Product.all
        when 'COFFEE'
          @products = Product.where("category = 'COFFEE'")
        when 'Drinkware'
          @products = Product.where("category = 'Drinkware'")
        when 'Brewtools'
          @products = Product.where("category = 'Brewtools'")
        when 'SingleOrigin'
          @products = Product.where("category = 'SingleOrigin'")
        when 'Instant'
          @products = Product.where("category = 'Instant'")
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