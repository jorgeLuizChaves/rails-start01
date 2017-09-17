class ProductsController < ApplicationController

  def index
      @products = Product.all.order :name
  end

  def new

  end

  def create
    values = params.required(:product).permit!
    Product.create values
    redirect_to root_url
  end

  def destroy
    id = params[:id]
    Product.destroy id
    redirect_to root_url
  end


end