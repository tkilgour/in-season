class ProductsController < ApplicationController
  def show
    @product = Product.find(param[:id])
  end
end
