class ProductsController < ApplicationController
  def index
    @products =  Product.all.page(params[:page]).per(36)
  end

  def show
    @product = Product.find_by(id: params[:id])
    @recommended_products = Product.random.limit(6)
  end
end
